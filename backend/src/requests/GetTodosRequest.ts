export interface GetTodosRequest {
  limit: number,
  nextKey: AWS.DynamoDB.Key
}