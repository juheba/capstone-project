export interface GetCollectionsRequest {
  limit?: number,
  nextKey?: AWS.DynamoDB.Key
}