import 'source-map-support/register'

import { APIGatewayProxyEvent, APIGatewayProxyResult } from 'aws-lambda'

import { createAttachmentPresignedUrl } from '@businessLogic/Attachments';
import { CreateAttachmentRequest } from '@requests/attachment'

import { createLogger, middyfy, getUserId } from '@utils'

const logger = createLogger('generateUploadUrl')

const handler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  var attachment: CreateAttachmentRequest;

  try {
    attachment = parseBody(event)
  } catch (e) {
    return createBadRequestResponse(e.message)
  }

  if ((attachment.itemId == null || attachment.itemId === undefined) && (attachment.locationId == null || attachment.locationId === undefined)) {
    return createBadRequestResponse('\'itemId\' or \'locationId\' is required.')
  } else if (attachment.itemId?.length > 0 && attachment.locationId?.length > 0) {
    return createBadRequestResponse('\'itemId\' and \'locationId\' are mutually exclusive.')
  }

  let result;
  try {
    result = await createAttachmentPresignedUrl(userId, attachment)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      logger.info({message: 'No entry found with the provided id', userId: userId})
      return createNotFoundResponse(`No entry found with the provided id`)
    }
    throw error;
  }

  return {
    statusCode: 201,
    body: JSON.stringify({
      uploadUrl: result
    })
  }
}

export const main = middyfy(handler);

/**
 * Parses a string to a JSON object.
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns {Object} JSON representation of the provided string
 * @throws {Error} if body is undefined or null
 */
function parseBody(event) {
  // The middy plugin already convert API Gateways `event.body` property, originally passed as a stringified JSON, to its corresponding parsed object.
  //var parsedBody = typeof event.body === 'string' ? JSON.parse(event.body) : event.body  // Not necessary because of middy plugin

  var parsedBody = event.body
  if (parsedBody === undefined || parsedBody === null) {
    throw new Error('body does not exist.')
  }

  return parsedBody
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
