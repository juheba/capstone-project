import { Lending } from './Lending';

export interface LendingsWithLastKey {
  locations: Lending[],
  lastKey: AWS.DynamoDB.DocumentClient.Key
}