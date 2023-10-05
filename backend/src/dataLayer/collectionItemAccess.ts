import { DocumentClient } from "aws-sdk/clients/dynamodb";

import { Collection, CollectionsWithLastKey } from "@models/collection";
import { Item, ItemsWithLastKey } from "@models/item";

import { createLogger} from '@utils'


const logger = createLogger('collectionItemAccess')

const AWSXRay = require('aws-xray-sdk');
const AWS = AWSXRay.captureAWS(require('aws-sdk'));

function createDynamoDBClient(): DocumentClient {
  if (process.env.IS_OFFLINE) {
    logger.info('Creating a local DynamoDB instance')
    return new AWS.DynamoDB.DocumentClient({
      region: 'localhost',
      endpoint: 'http://localhost:8000',
      accessKeyId: 'DEFAULT_ACCESS_KEY',  // needed if you don't have aws credentials at all in env
      secretAccessKey: 'DEFAULT_SECRET' // needed if you don't have aws credentials at all in env
    })
  }
  return new AWS.DynamoDB.DocumentClient();
}

export class CollectionItemAccess {

  constructor(
    private readonly docClient: DocumentClient = createDynamoDBClient(),
    private readonly collectionItemTable = process.env.COLLECTION_ITEM_TABLE,
    private readonly collectionItemIndex = process.env.COLLECTION_ITEM_INDEX) {
  }

  async getCollectionsForItem(userId: string, itemId: string, limit: number, nextKey: AWS.DynamoDB.Key) {
    logger.info({message: 'Getting collections by item', itemId: itemId, userId: userId})

    console.warn(`itemId: ${itemId}`)
    console.warn(`collectionItemIndex: ${this.collectionItemIndex}`)

    const queryParams = {
      TableName: this.collectionItemTable,
      IndexName: this.collectionItemIndex,
      Limit: limit,
      ExclusiveStartKey: nextKey,
      KeyConditionExpression: 'itemId = :itemId',
      ExpressionAttributeValues: {
        ':itemId': itemId
      },
      /**
       * If ScanIndexForward is true, DynamoDB returns the results in the order in which they are stored (by sort key value). This is the default behavior.
       * If ScanIndexForward is false, DynamoDB reads the results in reverse order by sort key value, and then returns the results to the client.
       */
      //ScanIndexForward: false  // reverses the result order, meaning last inserted images comes first
    }

    const result = await this.docClient.query(queryParams).promise()
    const collectionIds = (result.Items || []).map(item => item.collectionId);
    return {
      collectionIds,
      lastKey: result.LastEvaluatedKey
    }
  }

  async getItemsForCollection(userId: string, collectionId: string, limit: number, nextKey: AWS.DynamoDB.Key) {
    logger.info({message: 'Getting items by collection', collectionId: collectionId, userId: userId})

    const queryParams = {
      TableName: this.collectionItemTable,
      Limit: limit,
      ExclusiveStartKey: nextKey,
      KeyConditionExpression: 'collectionId = :collectionId',
      ExpressionAttributeValues: {
        ':collectionId': collectionId
      },
      /**
       * If ScanIndexForward is true, DynamoDB returns the results in the order in which they are stored (by sort key value). This is the default behavior.
       * If ScanIndexForward is false, DynamoDB reads the results in reverse order by sort key value, and then returns the results to the client.
       */
      //ScanIndexForward: false  // reverses the result order, meaning last inserted images comes first
    }

    const result = await this.docClient.query(queryParams).promise()
    const itemIds = (result.Items || []).map(item => item.itemId);
    return {
      itemIds,
      lastKey: result.LastEvaluatedKey
    }
  }

  /*
  async updateCollectionRelationships(userId: string, collectionId: string, itemIds: string[]) {
    logger.info({message: 'Update collection relationships', collectionId: collectionId, userId: userId})

    logger.info({message: 'Getting items by collection and determine additions and deletions', collectionId: collectionId, userId: userId})

    const queryParams = {
      TableName: this.collectionItemTable,
      KeyConditionExpression: 'collectionId = :collectionId',
      ExpressionAttributeValues: {
        ':collectionId': collectionId
      }
    }

    // 1. Fetch current relations
    const currentRelationsResponse = await this.docClient.query(queryParams).promise();
    const currentRelations = (currentRelationsResponse.Items || []).map(item => item.itemId);

    // 2. Determine additions and deletions
    const additions = itemIds.filter(itemId => !currentRelations.includes(itemId));
    const deletions = currentRelations.filter(itemId => !itemIds.includes(itemId));

    if (additions.length === 0 && deletions.length === 0) {
      logger.info({message: 'No items to write or delete. Skipping batchWrite.', collectionId: collectionId, userId: userId})
      return true;
    }

    // 3. Batch write operations
    const batchWriteRequests = [];

    for (const itemId of additions) {
        batchWriteRequests.push({
            PutRequest: {
                Item: {
                    collectionId,
                    itemId
                }
            }
        });
    }

    for (const itemId of deletions) {
        batchWriteRequests.push({
            DeleteRequest: {
                Key: {
                    collectionId,
                    itemId
                }
            }
        });
    }

    logger.info({message: 'Process BatchWrite to update collection relationships', collectionId: collectionId, userId: userId})

    const batchWriteParams = {
      RequestItems: {
          [this.collectionItemTable]: batchWriteRequests
      }
    }

    const result = await this.docClient.batchWrite(batchWriteParams).promise();

    if (result.UnprocessedItems && result.UnprocessedItems[this.collectionItemTable]) {
      const unprocessedRequests = result.UnprocessedItems[this.collectionItemTable];
      logger.error({message: `Unprocessed items found: ${unprocessedRequests}`, collectionId: collectionId, userId: userId})
      return false;
    }

    return true;
  }*/

  async updateCollectionRelationships(userId: string, collectionId: string, itemIds: string[]) {
    return await this.updateRelationships(userId, collectionId, itemIds, "collectionId", "itemId")
  }

  async updateItemRelationships(userId: string, itemId: string, collectionIds: string[]) {
    return await this.updateRelationships(userId, itemId, collectionIds, "itemId", "collectionId")
  }

  async updateRelationships(userId: string, sourceId: string, targetIds: string[], sourceIdName: string, targetIdName: string) {
    logger.info({message: 'Update collection item relationships', [sourceIdName]: sourceId, userId: userId})

    logger.info({message: `Getting relationships by ${sourceIdName} and determine additions and deletions`, [sourceIdName]: sourceId, userId: userId})

    let attributeValues = {};
    attributeValues[`:${sourceIdName}`] = sourceId;

    const queryParams = {
      TableName: this.collectionItemTable,
      KeyConditionExpression: `${sourceIdName} = :${sourceIdName}`,
      ExpressionAttributeValues: attributeValues
    }

    // 1. Fetch current relations
    const currentRelationsResponse = await this.docClient.query(queryParams).promise();
    const currentRelations = (currentRelationsResponse.Items || []).map(item => item[targetIdName]);

    // 2. Determine additions and deletions
    const additions = targetIds.filter(targetId => !currentRelations.includes(targetId));
    const deletions = currentRelations.filter(targetId => !targetIds.includes(targetId));

    if (additions.length === 0 && deletions.length === 0) {
      logger.info({message: 'No relationships to write or delete. Skipping batchWrite.', [sourceIdName]: sourceId, userId: userId})
      return true;
    }

    // 3. Batch write operations
    const batchWriteRequests = [];

    for (const targetId of additions) {
        batchWriteRequests.push({
            PutRequest: {
                Item: {
                  [sourceIdName]: sourceId,
                  [targetIdName]: targetId
                }
            }
        });
    }

    for (const targetId of deletions) {
        batchWriteRequests.push({
            DeleteRequest: {
                Key: {
                  [sourceIdName]: sourceId,
                  [targetIdName]: targetId
                }
            }
        });
    }

    logger.info({message: 'Process BatchWrite to update relationships.', [sourceIdName]: sourceId, userId: userId})

    const batchWriteParams = {
      RequestItems: {
          [this.collectionItemTable]: batchWriteRequests
      }
    }

    const result = await this.docClient.batchWrite(batchWriteParams).promise();

    if (result.UnprocessedItems && result.UnprocessedItems[this.collectionItemTable]) {
      const unprocessedRequests = result.UnprocessedItems[this.collectionItemTable];
      logger.error({message: `Unprocessed entries found: ${unprocessedRequests}`, [sourceIdName]: sourceId, userId: userId})
      return false;
    }

    return true;
  }

  /*async addRelationship(userId: string, itemId: string, collectionId: string) {
    logger.info({message: 'Add a relationship', collectionId: collectionId, itemId: itemId, userId: userId})

    var params = {
      TableName : this.collectionItemTable,
      Item: {
        itemId: itemId,
        collectionId: collectionId
      }
    };
    const result = await this.docClient.put(params).promise()
    return !!result.Attributes;
  }

  async removeRelationship(userId: string, itemId: string, collectionId: string): Promise<Boolean> {
    logger.info({message: 'Remove a relationship', collectionId: collectionId, itemId: itemId, userId: userId})
 
    const params = {
      TableName: this.collectionItemTable,
      Key: {
        itemId,
        collectionId
      },
      ConditionExpression: "attribute_exists(itemId) AND attribute_exists(collectionId)",
      ReturnValues: "ALL_OLD"
    }

    const result = await this.docClient.delete(params).promise();
    return !!result.Attributes;
  }*/

}