import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { deleteCollection } from '@businessLogic/Collections';
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, ResourceNotFoundError, InternalServerError } from '@models/errors';

const logger = createLogger('deleteCollections')

// Remove a collection item by id
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let collectionId: string;

  try {
    collectionId = parseCollectionParameter(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  let result;
  try {
    result = await deleteCollection(userId, collectionId)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      const errMsg = 'No collection found with the provided collectionId'
      logger.info({message: errMsg, collectionId: collectionId, userId: userId})
      return ResourceNotFoundError.setDetails(`${errMsg}: ${collectionId}`).asJSONResponse();
    }
    const errMsg = `Unexpected error while deleting collection: ${collectionId}. Error: ${JSON.stringify(error)}`
    return InternalServerError.setDetails(errMsg).asJSONResponse();
  }

  if (!result) {
    return InternalServerError.setDetails(`Couldn't delete collection with the provided collectionId: ${collectionId}`).asJSONResponse();
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
