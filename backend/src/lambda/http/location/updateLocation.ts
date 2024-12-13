import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { updateLocation } from '@businessLogic/Locations'
import { UpdateLocationRequest } from '@requests/location/UpdateLocationRequest'
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, InternalServerError, ResourceNotFoundError } from '@models/errors/DefaultErrors';

const logger = createLogger('updateLocation')

// Update a Location with the provided id using values in the "updatedLocation" object
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let locationId: string;
  var updatedLocation: UpdateLocationRequest;
  
  try {
    locationId = parseLocationParameter(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  try {
    updatedLocation = parseBody(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  let result;
  try {
    result = await updateLocation(userId, locationId, updatedLocation)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      const errMsg = 'No location found with the provided locationId'
      logger.info({message: errMsg, locationId: locationId, userId: userId})
      return ResourceNotFoundError.setDetails(`${errMsg}: ${locationId}`).asJSONResponse();
    }
    const errMsg = `Unexpected error while deleting location: ${locationId}. Error: ${JSON.stringify(error)}`
    return InternalServerError.setDetails(errMsg).asJSONResponse();
  }

  return {
    statusCode: 200,
    body: JSON.stringify({
      location: result
    })
  }

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
 * Parses a string to a JSON object.
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns JSON representation of the provided string
 * @throws Error if body is undefined or null
 */
function parseBody(event): UpdateLocationRequest {
  // The middy plugin already convert API Gateways `event.body` property, originally passed as a stringified JSON, to its corresponding parsed object.
  //var parsedBody = typeof event.body === 'string' ? JSON.parse(event.body) : event.body  // Not necessary because of middy plugin

  var parsedBody = event.body
  if (parsedBody === undefined || parsedBody === null) {
    throw new Error('body does not exist.')
  }
  // Because "pattern": "^.*\\S.*$" in update-location-request.json does not work for inputs like this: " \n\tTest"
  if(parsedBody.name.trim() === '') {
    throw new Error('name is empty.')
  }
  return parsedBody as UpdateLocationRequest
}