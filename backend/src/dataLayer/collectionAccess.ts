import { DocumentClient } from "aws-sdk/clients/dynamodb";

import { Collection, CollectionsWithLastKey } from "@models/collection";

import { createLogger, createDynamoDBClient } from '@utils'

const logger = createLogger('collectionAccess')

export class CollectionAccess {

  constructor(
    private readonly docClient: DocumentClient = createDynamoDBClient(logger),
    private readonly collectionsTable = process.env.COLLECTION_TABLE) {
  }

  async getCollectionsForUser(userId: string, limit: number, nextKey: AWS.DynamoDB.Key): Promise<CollectionsWithLastKey> {
    logger.info({message: 'Getting collections by user', userId: userId})

    const queryParams = {
      TableName: this.collectionsTable,
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
      collections: result.Items as Collection[],
      lastKey: result.LastEvaluatedKey
    }
  }

  async getCollectionsByIds(userId: string, collectionIds: string[]): Promise<Collection[]> {
    logger.info({message: 'Getting collections by ids', userId: userId})

    const keys = collectionIds.map(collectionId => ({ 
      userId: userId,
      collectionId
    }));

    const params = {
        RequestItems: {
            [this.collectionsTable]: {
                Keys: keys
            }
        }
    };

    const response = await this.docClient.batchGet(params).promise();
    return (response.Responses?.[this.collectionsTable] || []) as Collection[];
  }

  async createCollection(userId: string, collection: Collection) {
    logger.info({message: 'Creating a collection', collectionId: collection.collectionId, userId: userId})

    var params = {
      TableName : this.collectionsTable,
      Item: collection
    };
    await this.docClient.put(params).promise()
    return collection
  }

  async updateCollection(userId: string, updatedCollection): Promise<Collection> {
    logger.info({message: 'Updating a collection', collectionId: updatedCollection.collectionId, userId: userId})

    var params = {
      TableName : this.collectionsTable,
      Key: {
        userId,
        collectionId: updatedCollection.collectionId
      },
      UpdateExpression: "SET #n = :name, description = :description, visibility = :visibility, lastModified = :lastModified",
      ExpressionAttributeValues: {
        ":name": updatedCollection.name,
        ":description": updatedCollection.description,
        ":visibility": updatedCollection.visibility,
        ":lastModified": updatedCollection.lastModified,
      },
      ExpressionAttributeNames: {  // Because name is a reserved keyword
        "#n": "name"
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(collectionId)",
      ReturnValues: "ALL_NEW"
    };
    const result = await this.docClient.update(params).promise()
    return result.Attributes as Collection
  }

  async deleteCollection(userId: string, collectionId: string): Promise<Boolean> {
    logger.info({message: 'Delete collection', collectionId: collectionId, userId: userId})
 
    const params = {
      TableName: this.collectionsTable,
      Key: {
        userId,
        collectionId
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(collectionId)",
      ReturnValues: "ALL_OLD"
    }

    const result = await this.docClient.delete(params).promise();
    return !!result.Attributes;
  }

  /**
   * Validates if a collection exists.
   *
   * @param userId  Id of a user
   * @param collectionId  Id of a collection
   * @returns  true if collection exists, false otherwise
   */
  async validateCollectionExists(userId: string, collectionId: string): Promise<Boolean> {
    logger.info({message: 'Validate collection exists', collectionId: collectionId, userId: userId})
    const getParams = {
      TableName: this.collectionsTable,
      Key: {
        userId,
        collectionId
      },
    }

    const result = await this.docClient.get(getParams).promise()
    return !!result.Item
  }
}