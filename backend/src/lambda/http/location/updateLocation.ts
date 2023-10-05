import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { updateLocation } from '@businessLogic/Locations'
import { UpdateLocationRequest } from '@requests/location/UpdateLocationRequest'
import { createLogger, middyfy, getUserId } from '@utils'

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
    return createBadRequestResponse(e.message)
  }

  try {
    updatedLocation = parseBody(event)
  } catch (e) {
    return createBadRequestResponse(e.message)
  }

  let result;
  try {
    result = await updateLocation(userId, locationId, updatedLocation)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      const msg = 'No location found with the provided locationId'
      logger.info({message: msg, locationId: locationId, userId: userId})
      return createNotFoundResponse(`${msg}: ${locationId}`)
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
function parseBody(event): UpdateLocationRequest {
  // The middy plugin already convert API Gateways `event.body` property, originally passed as a stringified JSON, to its corresponding parsed object.
  //var parsedBody = typeof event.body === 'string' ? JSON.parse(event.body) : event.body  // Not necessary because of middy plugin

  var parsedBody = event.body
  if (parsedBody === undefined || parsedBody === null) {
    throw new Error('body does not exist.')
  }
  // Because "pattern": "^.*\\S.*$" in update-location-model.json does not work for inputs like this: " \n\tTest"
  if(parsedBody.name.trim() === '') {
    throw new Error('name is empty.')
  }
  return parsedBody as UpdateLocationRequest
}