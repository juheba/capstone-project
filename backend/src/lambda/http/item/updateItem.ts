import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { updateItem } from '@businessLogic/Items'
import { UpdateItemRequest } from '@requests/item/UpdateItemRequest'
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, InternalServerError, ResourceNotFoundError } from '@models/errors/DefaultErrors';

const logger = createLogger('updateItem')

// Update a Item item with the provided id using values in the "updatedItem" object
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let itemId: string;
  var updatedItem: UpdateItemRequest;
  
  try {
    itemId = parseItemParameter(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  try {
    updatedItem = parseBody(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  let result;
  try {
    result = await updateItem(userId, itemId, updatedItem)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
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
 * Parses a string to a JSON object.
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns JSON representation of the provided string
 * @throws Error if body is undefined or null
 */
function parseBody(event): UpdateItemRequest {
  // The middy plugin already convert API Gateways `event.body` property, originally passed as a stringified JSON, to its corresponding parsed object.
  //var parsedBody = typeof event.body === 'string' ? JSON.parse(event.body) : event.body  // Not necessary because of middy plugin

  var parsedBody = event.body
  if (parsedBody === undefined || parsedBody === null) {
    throw new Error('body does not exist.')
  }
  // Because "pattern": "^.*\\S.*$" in update-item-request.json does not work for inputs like this: " \n\tTest"
  if(parsedBody.title.trim() === '') {
    throw new Error('title is empty.')
  }
  return parsedBody as UpdateItemRequest
}