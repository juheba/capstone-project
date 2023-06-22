import { TodoItem } from "./TodoItem";

export interface TodosWithLastKey {
  todos: TodoItem[],
  lastKey: AWS.DynamoDB.DocumentClient.Key
}