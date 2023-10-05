import { Item } from './Item';

export interface ItemsWithLastKey {
  items: Item[],
  lastKey: AWS.DynamoDB.DocumentClient.Key
}