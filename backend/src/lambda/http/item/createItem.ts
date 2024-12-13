import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { CreateItemRequest } from '@requests/item'
import { createItem } from '@businessLogic/Items';
import { createLogger, middyfy, getUserId } from '@utils'
import { BadRequestParameterError } from '@models/errors/DefaultErrors';

const logger = createLogger('createItems')

const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  var item: CreateItemRequest;

  try {
    item = parseBody(event)
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  const newItem = await createItem(userId, item)
  return {
      statusCode: 201,
      body: JSON.stringify({
          item: newItem
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

  // Because "pattern": "^.*\\S.*$" in create-item-request.json does not work for inputs like this: " \n\tTest"
  if(parsedBody.title.trim() === '') {
    throw new Error('title is empty.')
  }
  return parsedBody
}
