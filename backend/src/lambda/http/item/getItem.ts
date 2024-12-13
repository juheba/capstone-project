import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { getItemById } from '@businessLogic/Items';
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, InternalServerError, ResourceNotFoundError } from '@models/errors/DefaultErrors';

const logger = createLogger('getItems')

// Get all items for a current user
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
    result = await getItemById(userId, itemId)
  } catch (error) {
    if (error.message.includes('Item not found')) {
      const errMsg = 'No item found with the provided itemId'
      logger.info({message: errMsg, itemId: itemId, userId: userId})
      return ResourceNotFoundError.setDetails(`${errMsg}: ${itemId}`).asJSONResponse();
    }
    const errMsg = `Unexpected error while deleting item: ${itemId}. Error: ${JSON.stringify(error)}`
    return InternalServerError.setDetails(errMsg).asJSONResponse();
  }

  return {
    statusCode: 200,
    body: JSON.stringify({
      item: result
    })
  }
};

export const main = middyfy(handler);

/**
 * Get value of the itemId path parameter or return "undefined"
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns {string} value of collectionId or "undefined" if the parameter is not defined
 * @throws {Error} if itemId is not a valid (number, null or id is missing)
 */
function parseItemParameter(event) {
  let itemId = event.pathParameters.itemId

  if (itemId === undefined) {
    throw new Error('parameter \'itemId\' is not valid.')
  }
  return itemId
}
