import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { deleteLocation } from '@businessLogic/Locations';
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, InternalServerError, ResourceNotFoundError } from '@models/errors/DefaultErrors';

const logger = createLogger('deleteLocations')

// Remove a location by id
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let locationId: string;

  try {
    locationId = parseLocationParameter(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  let result;
  try {
    result = await deleteLocation(userId, locationId)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      const errMsg = 'No location found with the provided locationId'
      logger.info({message: errMsg, locationId: locationId, userId: userId})
      return ResourceNotFoundError.setDetails(`${errMsg}: ${locationId}`).asJSONResponse();
    }
    const errMsg = `Unexpected error while deleting location: ${locationId}. Error: ${JSON.stringify(error)}`
    return InternalServerError.setDetails(errMsg).asJSONResponse();
  }

  if (!result) {
    return InternalServerError.setDetails(`Couldn't delete location with the provided locationId: ${locationId}`).asJSONResponse();
  }

  return createNoContentResponse()
}

export const main = middyfy(handler);

/**
 * Get value of the locationId path parameter or return "undefined"
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns {string} value of locationId or "undefined" if the parameter is not defined
 * @throws {Error} if locationId is not a valid (number, null or id is missing)
 */
function parseLocationParameter(event) {
  let locationId = event.pathParameters.locationId

  if (locationId === undefined) {
    throw new Error('parameter \'locationId\' is not valid.')
  }
  return locationId
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
