import 'source-map-support/register'

import { APIGatewayProxyHandler, APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import { getItemsForUser } from '@businessLogic/Items';
import { createLogger, middyfy, getUserId } from '@utils'

import { DynamoDB } from "aws-sdk";
import { BadRequestParameterError, InternalServerError } from '@models/errors/DefaultErrors';

const logger = createLogger('getItems')

// Get all items for a current user
const handler: APIGatewayProxyHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(`Processing event: ${event}`)

  let userId = getUserId(event);
  let limit: number;
  let nextKey: DynamoDB.Key;

  try {
    limit = parseLimitParameter(event)      // Maximum number of elements to return
    nextKey = parseNextKeyParameter(event)  // Next key to continue scan operation if necessary
  } catch (e) {
    return BadRequestParameterError.setDetails(e.message).asJSONResponse();
  }

  let result;
  try {
    result = await getItemsForUser(userId, {limit, nextKey})
  } catch (error) {
    if (error.code === 'ValidationException') {
      const errMsg = `ValidationException while get items. Error: ${JSON.stringify(error)}`
      logger.info({message: errMsg, userId: userId})
      return BadRequestParameterError.setDetails(error.message).asJSONResponse();
    }
    const errMsg = `Unexpected error while get items. Error: ${JSON.stringify(error)}`
    return InternalServerError.setDetails(errMsg).asJSONResponse();
  }

  if (!result) {
    return InternalServerError.setDetails(`Couldn't get items`).asJSONResponse();
  }

  return {
    statusCode: 200,
    body: JSON.stringify({
      items: result.items,
      // Encode the JSON object so a client can return it in a URL as is
      nextKey: encodeNextKey(result.lastKey)
    })
  }
};

export const main = middyfy(handler);


/**
 * Get value of the limit query parameter or return "undefined"
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns {string} value of limit or "undefined" if the parameter is not defined
 * @throws {Error} if limit is not a number or limit is a negative number
 */
function parseLimitParameter(event) {
  let limit = getQueryParameter(event, 'limit')

  if (limit !== undefined) {
    limit = parseInt(limit)
    if (isNaN(limit)) {
      throw new Error('parameter \'limit\' is not a number.')
    }
    if (limit <= 0) {
      throw new Error('parameter \'limit\' must be a positive number.')
    }
  }
  return limit
}

/**
 * Get value of the nextKey query parameter or return "undefined"
 *
 * @param {Object} event HTTP event passed to a Lambda function
 *
 * @returns {string} value of nextKey or "undefined" if the parameter is not defined
 * @throws {Error} if decoded nextKey is not a valid (null or id is missing)
 */
function parseNextKeyParameter(event) {
  let nextKey = getQueryParameter(event, 'nextKey')

  if (nextKey !== undefined) {
    nextKey = decodeNextKey(nextKey)
    if (nextKey == null || nextKey.itemId === undefined || nextKey.userId === undefined) {
      throw new Error('parameter \'nextKey\' is not valid.')
    }
  }
  return nextKey
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
 * Encode last evaluated key using
 *
 * @param {Object} lastEvaluatedKey a JS object that represents last evaluated key
 *
 * @return {string} URI encoded last evaluated key
 */
function encodeNextKey(lastEvaluatedKey) {
  if (!lastEvaluatedKey) {
    return null
  }

  return encodeURIComponent(JSON.stringify(lastEvaluatedKey))
}

/**
 * Decode next key
 *
 * @param {string} nextKey a string that represents a URI encoded next key
 *
 * @return {Object} last key as JSON Object
 */
function decodeNextKey(nextKey) {
  if (!nextKey) {
    return null
  }
  return JSON.parse(decodeURIComponent(nextKey));
}