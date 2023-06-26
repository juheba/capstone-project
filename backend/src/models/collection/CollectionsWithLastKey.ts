import { Collection } from './Collection';

export interface CollectionsWithLastKey {
  collections: Collection[],
  lastKey: AWS.DynamoDB.DocumentClient.Key
}