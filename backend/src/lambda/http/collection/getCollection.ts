import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { getCollectionById } from '@businessLogic/Collections';
import { createLogger, middyfy, getUserId } from '@utils'

const logger = createLogger('getCollection')

// Get a Collection for a current user
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
    result = await getCollectionById(userId, collectionId)
  } catch (error) {
    if (error.message.includes('Collection not found')) {
      logger.info({message: 'No entry found with the provided collectionId', collectionId: collectionId, userId: userId})
      return createNotFoundResponse(`No collection found with the provided collectionId: ${collectionId}`)
    }
    throw error;
  }

  return {
    statusCode: 200,
    body: JSON.stringify({
      collection: result,
    })
  }
};

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
 * @returns {string} a json stringifed bad request response
 */
function createNotFoundResponse(details) {
  const err = {statusCode:404, errorCode:'T000', message:'Collection not found', details}
  return {
    statusCode: 404,
    body: JSON.stringify(err)
  }
}
