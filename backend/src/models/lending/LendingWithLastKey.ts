import { Lending } from './Lending';

export interface LendingWithLastKey {
  locations: Lending[],
  lastKey: AWS.DynamoDB.DocumentClient.Key
}