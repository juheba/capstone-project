import { Location } from './Location';

export interface LocationsWithLastKey {
  locations: Location[],
  lastKey: AWS.DynamoDB.DocumentClient.Key
}