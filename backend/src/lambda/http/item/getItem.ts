import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { getItemById } from '@businessLogic/Items';
import { createLogger, middyfy, getUserId } from '@utils'

import { DynamoDB } from "aws-sdk";

const logger = createLogger('getItems')

// Get all TODO items for a current user
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let itemId: string;

  try {
    itemId = parseItemParameter(event)
  } catch (e) {
    return createBadRequestResponse(e.message)
  }

  let result;
  try {
    result = await getItemById(userId, itemId)
  } catch (error) {
    if (error.message.includes('Item not found')) {
      logger.info({message: 'No entry found with the provided itemId', itemId: itemId, userId: userId})
      return createNotFoundResponse(`No item found with the provided itemId: ${itemId}`)
    }
    throw error;
  }

  return {
    statusCode: 200,
    body: JSON.stringify({
      item: result
    })
  }
};

export const main = middyfy(handler);

/**
 * Get value of the itemId path parameter or return "undefined"
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns {string} value of collectionId or "undefined" if the parameter is not defined
 * @throws {Error} if itemId is not a valid (number, null or id is missing)
 */
function parseItemParameter(event) {
  let itemId = event.pathParameters.itemId

  if (itemId === undefined) {
    throw new Error('parameter \'itemId\' is not valid.')
  }
  return itemId
}

/**
 * Get a query parameter or return "undefined"
 *
 * @param {Object} event HTTP event passed to a Lambda function
 * @param name a name of a query parameter to return
 *
 * @returns a value of a query parameter value or "undefined" if a parameter is not defined
 */
function getQueryParameter(event, name: string) {
  const queryParams = event.queryStringParameters
  if (!queryParams) {
    return undefined
  }

  return queryParams[name]
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
 * @returns {string} a json stringifed bad request response
 */
function createNotFoundResponse(details) {
  const err = {statusCode:404, errorCode:'T000', message:'Collection not found', details}
  return {
    statusCode: 404,
    body: JSON.stringify(err)
  }
}