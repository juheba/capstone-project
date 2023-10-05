import { DocumentClient } from "aws-sdk/clients/dynamodb";
import { initAWS } from '@utils'

export function createDynamoDBClient(logger): DocumentClient {
  const AWS = initAWS()

  if (process.env.IS_OFFLINE) {
    logger.info('Creating a local DynamoDB instance')
    return new AWS.DynamoDB.DocumentClient({
      region: 'localhost',
      endpoint: 'http://localhost:8000',
      accessKeyId: 'DefaultAccessKey',  // needed if you don't have aws credentials at all in env
      secretAccessKey: 'DefaultSecret' // needed if you don't have aws credentials at all in env
    })
  }
  return new AWS.DynamoDB.DocumentClient();
}