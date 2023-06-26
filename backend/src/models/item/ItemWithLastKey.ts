import { Item } from './Item';

export interface ItemWithLastKey {
  items: Item[],
  lastKey: AWS.DynamoDB.DocumentClient.Key
}