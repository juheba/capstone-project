import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { updateCollectionItems } from '@businessLogic/CollectionItems'
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, InternalServerError, ResourceNotFoundError } from '@models/errors/DefaultErrors';

const logger = createLogger('updateCollectionItems')

// Update a Collections relation to many items
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let collectionId: string;
  var itemIds: string[];
  
  try {
    collectionId = parseCollectionParameter(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  try {
    itemIds = parseBody(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  let result;
  try {
    result = await updateCollectionItems(userId, collectionId, itemIds)
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
    const errMsg = `Couldn't update all item relations of collection with the provided collectionId: ${collectionId}`
    return InternalServerError.setDetails(errMsg).asJSONResponse();
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

  if(parsedBody.itemIds === undefined) {
    throw new Error('itemIds is empty.')
  }
  return parsedBody.itemIds as string[]
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
