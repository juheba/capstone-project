import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { CreateCollectionRequest } from '@requests/collection'
import { createCollection } from '@businessLogic/Collections';
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError } from '@models/errors';

const logger = createLogger('createCollections')

const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  var collection: CreateCollectionRequest;

  try {
    collection = parseBody(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  const newCollection = await createCollection(userId, collection)
  return {
      statusCode: 201,
      body: JSON.stringify({
          collection: newCollection
      })
  }
};

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

  // Because "pattern": "^.*\\S.*$" in create-collection-request.json does not work for inputs like this: " \n\tTest"
  if(parsedBody.name.trim() === '') {
    throw new Error('name is empty.')
  }
  return parsedBody
}
