import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { deleteCollection } from '@businessLogic/Collections';
import { createLogger, middyfy, getUserId } from '@utils'

const logger = createLogger('deleteCollections')

// Remove a collection item by id
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let collectionId: string;

  try {
    collectionId = parseCollectionParameter(event)
  } catch (e) {
    return createBadRequestResponse(e.message)
  }

  let result;
  try {
    result = await deleteCollection(userId, collectionId)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      logger.info({message: 'No item found with the provided collectionId', collectionId: collectionId, userId: userId})
      return createNotFoundResponse(`No item found with the provided collectionId: ${collectionId}`)
    }
    // Re-throw the error if it wasn't a conditional check failure
    throw error;
  }

  if (!result) {
    return createInternalServerErrorResponse(`Couldn't delete item with the provided collectionId: ${collectionId}`)
  }

  return createNoContentResponse()
}

export const main = middyfy(handler);

/**
 * Get value of the collectionId path parameter or return "undefined"
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns {string} value of collectionId or "undefined" if the parameter is not defined
 * @throws {Error} if collectionId is not a valid (number, null or id is missing)
 */
function parseCollectionParameter(event) {
  let collectionId = event.pathParameters.collectionId

  if (collectionId === undefined) {
    throw new Error('parameter \'collectionId\' is not valid.')
  }
  return collectionId
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
  const err = {statusCode:400, errorCode:'T000', message:'Bad request parameter', details}
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