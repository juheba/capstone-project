import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { deleteItem } from '@businessLogic/Items';
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, InternalServerError, ResourceNotFoundError } from '@models/errors/DefaultErrors';

const logger = createLogger('deleteItems')

// Remove a item by id
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let itemId: string;

  try {
    itemId = parseItemParameter(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  let result;
  try {
    result = await deleteItem(userId, itemId)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      const errMsg = 'No item found with the provided itemId'
      logger.info({message: errMsg, itemId: itemId, userId: userId})
      return ResourceNotFoundError.setDetails(`${errMsg}: ${itemId}`).asJSONResponse();
    }
    const errMsg = `Unexpected error while deleting item: ${itemId}. Error: ${JSON.stringify(error)}`
    return InternalServerError.setDetails(errMsg).asJSONResponse();
  }

  if (!result) {
    return InternalServerError.setDetails(`Couldn't delete item with the provided itemId: ${itemId}`).asJSONResponse();
  }

  return createNoContentResponse()
}

export const main = middyfy(handler);

/**
 * Get value of the itemId path parameter or return "undefined"
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns {string} value of itemId or "undefined" if the parameter is not defined
 * @throws {Error} if itemId is not a valid (number, null or id is missing)
 */
function parseItemParameter(event) {
  let itemId = event.pathParameters.itemId

  if (itemId === undefined) {
    throw new Error('parameter \'itemId\' is not valid.')
  }
  return itemId
}

/**
 * Creates a 204 NO CONTENT response
 *
 * @returns {string} a response with no body
 */
function createNoContentResponse() {
  return {
    statusCode: 204,
    body: ""
  }
}
