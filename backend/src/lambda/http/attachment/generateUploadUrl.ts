import 'source-map-support/register'

import { APIGatewayProxyEvent, APIGatewayProxyResult } from 'aws-lambda'

import { createAttachmentPresignedUrl } from '@businessLogic/Attachments';
import { CreateAttachmentRequest } from '@requests/attachment'

import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError, InternalServerError, ResourceNotFoundError } from '@models/errors/DefaultErrors';

const logger = createLogger('generateUploadUrl')

const handler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  var attachment: CreateAttachmentRequest;

  try {
    attachment = parseBody(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  if ((attachment.itemId == null || attachment.itemId === undefined) && (attachment.locationId == null || attachment.locationId === undefined)) {
    const errMsg = '\'itemId\' or \'locationId\' is required.'
    return BadRequestParameterError.setDetails(errMsg).asJSONResponse();
  } else if (attachment.itemId?.length > 0 && attachment.locationId?.length > 0) {
    const errMsg = '\'itemId\' and \'locationId\' are mutually exclusive.'
    return BadRequestParameterError.setDetails(errMsg).asJSONResponse();
  }

  let result;
  try {
    result = await createAttachmentPresignedUrl(userId, attachment)
  } catch (error) {
    if (error.code === 'ConditionalCheckFailedException') {
      const errMsg = 'No entry found with the provided id'
      logger.info({message: errMsg, userId: userId})
      return ResourceNotFoundError.setDetails(`${errMsg}`).asJSONResponse();
    }
    const errMsg = `Unexpected error creating presigned url. Error: ${JSON.stringify(error)}`
    return InternalServerError.setDetails(errMsg).asJSONResponse();
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
