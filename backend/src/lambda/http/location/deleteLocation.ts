import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { deleteLocation } from '@businessLogic/Locations';
import { createLogger, middyfy, getUserId } from '@utils'

const logger = createLogger('deleteLocations')

// Remove a location by id
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let locationId: string;

  try {
    locationId = parseLocationParameter(event)
  } catch (e) {
    return createBadRequestResponse(e.message)
  }

  let result;
  try {
    result = await deleteLocation(userId, locationId)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      logger.info({message: 'No location found with the provided locationId', locationId: locationId, userId: userId})
      return createNotFoundResponse(`No location found with the provided locationId: ${locationId}`)
    }
    // Re-throw the error if it wasn't a conditional check failure
    throw error;
  }

  if (!result) {
    return createInternalServerErrorResponse(`Couldn't delete location with the provided locationId: ${locationId}`)
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