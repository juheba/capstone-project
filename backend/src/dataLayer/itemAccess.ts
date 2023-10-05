import { DocumentClient } from "aws-sdk/clients/dynamodb";

import { Item, ItemsWithLastKey } from "@models/item";

import { createLogger} from '@utils'

const logger = createLogger('itemAccess')

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

export class ItemAccess {

  constructor(
    private readonly docClient: DocumentClient = createDynamoDBClient(),
    private readonly itemsTable = process.env.ITEM_TABLE) {
  }

  async getItemsForUser(userId: string, limit: number, nextKey: AWS.DynamoDB.Key): Promise<ItemsWithLastKey> {
    logger.info({message: 'Getting items by user', userId: userId})

    const queryParams = {
      TableName: this.itemsTable,
      Limit: limit,
      ExclusiveStartKey: nextKey,
      KeyConditionExpression: 'userId = :userId',
      ExpressionAttributeValues: {
        ':userId': userId
      },
      /**
       * If ScanIndexForward is true, DynamoDB returns the results in the order in which they are stored (by sort key value). This is the default behavior.
       * If ScanIndexForward is false, DynamoDB reads the results in reverse order by sort key value, and then returns the results to the client.
       */
      //ScanIndexForward: false  // reverses the result order, meaning last inserted images comes first
    }

    const result = await this.docClient.query(queryParams).promise()
    return {
      items: result.Items as Item[],
      lastKey: result.LastEvaluatedKey
    }
  }

  async getItemsByIds(userId: string, itemIds: string[]): Promise<Item[]> {
    logger.info({message: 'Getting items by ids', userId: userId})

    const keys = itemIds.map(itemId => ({ 
      userId: userId,
      itemId
    }));

    const params = {
        RequestItems: {
            [this.itemsTable]: {
                Keys: keys
            }
        }
    };

    const response = await this.docClient.batchGet(params).promise();
    return (response.Responses?.[this.itemsTable] || []) as Item[];
  }

  async createItem(userId: string, item: Item) {
    logger.info({message: 'Creating a item', itemId: item.itemId, userId: userId})

    var params = {
      TableName : this.itemsTable,
      Item: item
    };
    await this.docClient.put(params).promise()
    return item
  }

  async updateItem(userId: string, updatedItem): Promise<Item> {
    logger.info({message: 'Updating a item', itemId: updatedItem.itemId, userId: userId})

    var params = {
      TableName : this.itemsTable,
      Key: {
        userId,
        itemId: updatedItem.itemId
      },
      UpdateExpression: "SET itemType = :itemType, title = :title, description = :description, isLendable = :isLendable, ownershipStatus = :ownershipStatus, #s = :status, lastModified = :lastModified",
      ExpressionAttributeValues: {
        ":itemType": updatedItem.itemType,
        ":title": updatedItem.title,
        ":description": updatedItem.description,
        ":isLendable": updatedItem.isLendable,
        ":ownershipStatus": updatedItem.ownershipStatus,
        ":status": updatedItem.status,
        ":lastModified": updatedItem.lastModified
      },
      ExpressionAttributeNames: {  // Because status is a reserved keyword
        "#s": "status"
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(itemId)",
      ReturnValues: "ALL_NEW"
    };
    const result = await this.docClient.update(params).promise()
    return result.Attributes as Item
  }

  async updateAttachmentUrl(userId: string, itemId: string, url: string): Promise<Item> {

    logger.info({message: 'Updating a items attachment', itemId: itemId, userId: userId})

    var params = {
      TableName : this.itemsTable,
      Key: {
        userId,
        itemId
      },
      UpdateExpression: "SET attachmentUrl = :url",
      ExpressionAttributeValues: {
        ":url": url,
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(itemId)",
      ReturnValues: "ALL_NEW"
    };
    const result = await this.docClient.update(params).promise()
    return result.Attributes as Item
  }

  async deleteItem(userId: string, itemId: string): Promise<Boolean> {
    logger.info({message: 'Delete item', itemId: itemId, userId: userId})
 
    const params = {
      TableName: this.itemsTable,
      Key: {
        userId,
        itemId
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(itemId)",
      ReturnValues: "ALL_OLD"
    }

    const result = await this.docClient.delete(params).promise();
    return !!result.Attributes;
  }

  /**
   * Validates if a item exists.
   *
   * @param userId  Id of a user
   * @param itemId  Id of a item
   * @returns  true if item exists
   * @throws Error if item does not exist
   */
  async validateItemExists(userId: string, itemId: string): Promise<Boolean> {
    logger.info({message: 'Validate item exists', itemId: itemId, userId: userId})
    const getParams = {
      TableName: this.itemsTable,
      Key: {
        userId,
        itemId
      },
    }

    const result = await this.docClient.get(getParams).promise()
    return !!result.Item
  }
}