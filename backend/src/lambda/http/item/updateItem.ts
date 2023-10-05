import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { updateItem } from '@businessLogic/Items'
import { UpdateItemRequest } from '@requests/item/UpdateItemRequest'
import { createLogger, middyfy, getUserId } from '@utils'

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
    return createBadRequestResponse(e.message)
  }

  try {
    updatedItem = parseBody(event)
  } catch (e) {
    return createBadRequestResponse(e.message)
  }

  let result;
  try {
    result = await updateItem(userId, itemId, updatedItem)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      const msg = 'No item found with the provided itemId'
      logger.info({message: msg, itemId: itemId, userId: userId})
      return createNotFoundResponse(`${msg}: ${itemId}`)
    }
    throw error;
  }

  return {
    statusCode: 200,
    body: JSON.stringify(result)
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
 * Creates a 400 BAD REQUEST response
 *
 * @param {string} details optional details to describe the error
 *
 * @returns {string} a json stringifed bad request response
 */
function createBadRequestResponse(details) {
  const err = {statusCode:400, errorCode:'T400', message:'Bad request parameter', details}
  return {
    statusCode: 400,
    body: JSON.stringify(err)
  }
}

/**
 * Creates a 404 NOT FOUND response
 *
 * @param {string} details optional details to describe the error
 *
 * @returns {string} a json stringifed not found response
 */
function createNotFoundResponse(details) {
  const err = {statusCode:404, errorCode:'T001', message:'Resource not found', details}
  return {
    statusCode: 404,
    body: JSON.stringify(err)
  }
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
  // Because "pattern": "^.*\\S.*$" in update-item-model.json does not work for inputs like this: " \n\tTest"
  if(parsedBody.title.trim() === '') {
    throw new Error('title is empty.')
  }
  return parsedBody as UpdateItemRequest
}