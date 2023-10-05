import { DocumentClient } from "aws-sdk/clients/dynamodb";

import { Location, LocationsWithLastKey } from "@models/location";

import { createLogger, createDynamoDBClient } from '@utils'

const logger = createLogger('locationAccess')

export class LocationAccess {

  constructor(
    private readonly docClient: DocumentClient = createDynamoDBClient(logger),
    private readonly locationsTable = process.env.LOCATION_TABLE) {
  }

  async getLocationsForUser(userId: string, limit: number, nextKey: AWS.DynamoDB.Key): Promise<LocationsWithLastKey> {
    logger.info({message: 'Getting locations by user', userId: userId})

    const queryParams = {
      TableName: this.locationsTable,
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
      locations: result.Items as Location[],
      lastKey: result.LastEvaluatedKey
    }
  }

  async createLocation(userId: string, location: Location) {
    logger.info({message: 'Creating a location', locationId: location.locationId, userId: userId})

    var params = {
      TableName : this.locationsTable,
      Item: location
    };
    await this.docClient.put(params).promise()
    return location
  }

  async updateLocation(userId: string, updatedLocation): Promise<Location> {
    logger.info({message: 'Updating a location', locationId: updatedLocation.locationId, userId: userId})

    var params = {
      TableName : this.locationsTable,
      Key: {
        userId,
        locationId: updatedLocation.locationId
      },
      UpdateExpression: "SET description = :description, #n = :name, lastModified = :lastModified",
      ExpressionAttributeValues: {
        ":name": updatedLocation.name,
        ":description": updatedLocation.description,
        ":lastModified": updatedLocation.lastModified
      },
      ExpressionAttributeNames: {  // Because name is a reserved keyword
        "#n": "name"
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(locationId)",
      ReturnValues: "ALL_NEW"
    };
    const result = await this.docClient.update(params).promise()
    return result.Attributes as Location
  }

  async updateAttachmentUrl(userId: string, locationId: string, url: string): Promise<Location> {

    logger.info({message: 'Updating a locations attachment', locationId: locationId, userId: userId})

    var params = {
      TableName : this.locationsTable,
      Key: {
        userId,
        locationId
      },
      UpdateExpression: "SET attachmentUrl = :url",
      ExpressionAttributeValues: {
        ":url": url,
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(locationId)",
      ReturnValues: "ALL_NEW"
    };
    const result = await this.docClient.update(params).promise()
    return result.Attributes as Location
  }

  async deleteLocation(userId: string, locationId: string): Promise<Boolean> {
    logger.info({message: 'Delete location', locationId: locationId, userId: userId})
 
    const params = {
      TableName: this.locationsTable,
      Key: {
        userId,
        locationId
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(locationId)",
      ReturnValues: "ALL_OLD"
    }

    const result = await this.docClient.delete(params).promise();
    return !!result.Attributes;
  }

  /**
   * Validates if a location exists.
   *
   * @param userId  Id of a user
   * @param locationId  Id of a location
   * @returns  true if location exists
   * @throws Error if location does not exist
   */
  async validateLocationExists(userId: string, locationId: string): Promise<Boolean> {
    logger.info({message: 'Validate location exists', locationId: locationId, userId: userId})
    const getParams = {
      TableName: this.locationsTable,
      Key: {
        userId,
        locationId
      },
    }

    const result = await this.docClient.get(getParams).promise()
    return !!result.Item
  }
}