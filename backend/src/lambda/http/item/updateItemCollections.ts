import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { updateItemCollections } from '@businessLogic/CollectionItems'
import { createLogger, middyfy, getUserId } from '@utils'

const logger = createLogger('updateItemCollections')

// Update a Items relation to many collections
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let itemId: string;
  var collectionIds: string[];
  
  try {
    itemId = parseItemParameter(event)
  } catch (e) {
    return createBadRequestResponse(e.message)
  }

  try {
    collectionIds = parseBody(event)
  } catch (e) {
    return createBadRequestResponse(e.message)
  }

  let result;
  try {
    result = await updateItemCollections(userId, itemId, collectionIds)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      const msg = 'No item found with the provided itemId'
      logger.info({message: msg, itemId: itemId, userId: userId})
      return createNotFoundResponse(`${msg}: ${itemId}`)
    }
    throw error;
  }

  if (!result) {
    return createInternalServerErrorResponse(`Couldn't update all collection relations of item with the provided itemId: ${itemId}`)
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
 * Parses a string to a JSON object.
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns JSON representation of the provided string
 * @throws Error if body is undefined or null
 */
function parseBody(event): string[] {
  // The middy plugin already convert API Gateways `event.body` property, originally passed as a stringified JSON, to its corresponding parsed object.
  //var parsedBody = typeof event.body === 'string' ? JSON.parse(event.body) : event.body  // Not necessary because of middy plugin

  var parsedBody = event.body
  if (parsedBody === undefined || parsedBody === null) {
    throw new Error('body does not exist.')
  }

  if(parsedBody.collectionIds === undefined) {
    throw new Error('collectionIds is empty.')
  }
  return parsedBody.collectionIds as string[]
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
 * Creates a 500 INTERNAL SERVER ERROR response
 *
 * @param {string} details optional details to describe the error
 *
 * @returns {string} a json stringifed internal server error response
 */
function createInternalServerErrorResponse(details) {
  const err = {statusCode:400, errorCode:'T500', message:'Unexpected Error', details}
  return {
    statusCode: 500,
    body: JSON.stringify(err)
  }
}