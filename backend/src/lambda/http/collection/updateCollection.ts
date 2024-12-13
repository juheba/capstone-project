import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { updateCollection } from '@businessLogic/Collections'
import { UpdateCollectionRequest } from '@requests/collection/UpdateCollectionRequest'
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, InternalServerError, ResourceNotFoundError } from '@models/errors/DefaultErrors';

const logger = createLogger('updateCollection')

// Update a Collection with the provided id using values in the "updatedCollection" object
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let collectionId: string;
  var updatedCollection: UpdateCollectionRequest;
  
  try {
    collectionId = parseCollectionParameter(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  try {
    updatedCollection = parseBody(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  let result;
  try {
    result = await updateCollection(userId, collectionId, updatedCollection)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      const errMsg = 'No collection found with the provided collectionId'
      logger.info({message: errMsg, collectionId: collectionId, userId: userId})
      return ResourceNotFoundError.setDetails(`${errMsg}: ${collectionId}`).asJSONResponse();
    }
    const errMsg = `Unexpected error while deleting collection: ${collectionId}. Error: ${JSON.stringify(error)}`
    return InternalServerError.setDetails(errMsg).asJSONResponse();
  }

  return {
    statusCode: 200,
    body: JSON.stringify({
      collection: result
    })
  }

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
function parseBody(event): UpdateCollectionRequest {
  // The middy plugin already convert API Gateways `event.body` property, originally passed as a stringified JSON, to its corresponding parsed object.
  //var parsedBody = typeof event.body === 'string' ? JSON.parse(event.body) : event.body  // Not necessary because of middy plugin

  var parsedBody = event.body
  if (parsedBody === undefined || parsedBody === null) {
    throw new Error('body does not exist.')
  }
  // Because "pattern": "^.*\\S.*$" in update-collection-request.json does not work for inputs like this: " \n\tTest"
  if(parsedBody.name.trim() === '') {
    throw new Error('name is empty.')
  }
  return parsedBody as UpdateCollectionRequest
}