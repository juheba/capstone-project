import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { getCollectionById } from '@businessLogic/Collections';
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, InternalServerError, ResourceNotFoundError } from '@models/errors/DefaultErrors';

const logger = createLogger('getCollection')

// Get a Collection for a current user
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
    result = await getCollectionById(userId, collectionId)
  } catch (error) {
    if (error.message.includes('Collection not found')) {
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
