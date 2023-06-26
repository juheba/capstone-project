import { Location } from './Location';

export interface LocationWithLastKey {
  locations: Location[],
  lastKey: AWS.DynamoDB.DocumentClient.Key
}