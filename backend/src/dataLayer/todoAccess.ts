import { DocumentClient } from "aws-sdk/clients/dynamodb";

import { TodoItem } from "../models/TodoItem";
import { TodosWithLastKey } from "../models/TodosWithLastKey";

import { createLogger, createDynamoDBClient } from '@utils'

const logger = createLogger('todoAccess')

export class TodoAccess {

  constructor(
    private readonly docClient: DocumentClient = createDynamoDBClient(logger),
    private readonly todosTable = process.env.TODOS_TABLE) {
  }

  async getTodosForUser(userId: string, limit: number, nextKey: AWS.DynamoDB.Key): Promise<TodosWithLastKey> {
    logger.info({message: 'Getting todos by user', userId: userId})

    const queryParams = {
      TableName: this.todosTable,
      Limit: limit,
      ExclusiveStartKey: nextKey,
      KeyConditionExpression: 'userId = :userId',
      ExpressionAttributeValues: {
        ':userId': userId
      },
      /**
       * If ScanIndexForward is true, DynamoDB returns the results in the order in which they are stored (by sort key value). This is the default behavior.
       * If ScanIndexForward is false, DynamoDB reads the results in reverse order by sort key value, and then returns the results to the client.
       */
      //ScanIndexForward: false  // reverses the result order, meaning last inserted images comes first
    }

    const result = await this.docClient.query(queryParams).promise()
    return {
      todos: result.Items as TodoItem[],
      lastKey: result.LastEvaluatedKey
    }
  }

  async getTodosById(userId: string, todoId: string): Promise<TodoItem> {
    logger.info({message: 'Getting a todo by id', todoId: todoId, userId: userId})

    const queryParams = {
      TableName: this.todosTable,
      KeyConditionExpression: 'todoId = :todoId',
      ExpressionAttributeValues: {
        ':todoId': todoId
      },
      /**
       * If ScanIndexForward is true, DynamoDB returns the results in the order in which they are stored (by sort key value). This is the default behavior.
       * If ScanIndexForward is false, DynamoDB reads the results in reverse order by sort key value, and then returns the results to the client.
       */
      //ScanIndexForward: false  // reverses the result order, meaning last inserted images comes first
    }

    const result = await this.docClient.query(queryParams).promise()
    return result.Items[0] as TodoItem
  }

  async createTodo(userId: string, todo: TodoItem) {
    logger.info({message: 'Creating a todo', todoId: todo.todoId, userId: userId})

    var params = {
      TableName : this.todosTable,
      Item: todo
    };
    await this.docClient.put(params).promise()
    return todo
  }

  async updateTodo(userId: string, updatedTodo): Promise<TodoItem> {
    logger.info({message: 'Updating a todo', todoId: updatedTodo.todoId, userId: userId})

    var params = {
      TableName : this.todosTable,
      Key: {
        userId,
        todoId: updatedTodo.todoId
      },
      UpdateExpression: "SET #n = :name, dueDate = :dueDate, done = :done",
      ExpressionAttributeValues: {
        ":name": updatedTodo.name,
        ":dueDate": updatedTodo.dueDate,
        ":done": updatedTodo.done,
      },
      ExpressionAttributeNames: {  // Because name is a reserved keyword
        "#n": "name"
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(todoId)",
      ReturnValues: "ALL_NEW"
    };
    const result = await this.docClient.update(params).promise()
    return result.Attributes as TodoItem
  }

  async updateAttachmentUrl(userId: string, todoId: string, url: string): Promise<TodoItem> {

    logger.info({message: 'Updating a todos attachment', todoId: todoId, userId: userId})

    var params = {
      TableName : this.todosTable,
      Key: {
        userId,
        todoId
      },
      UpdateExpression: "SET attachmentUrl = :url",
      ExpressionAttributeValues: {
        ":url": url,
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(todoId)",
      ReturnValues: "ALL_NEW"
    };
    const result = await this.docClient.update(params).promise()
    return result.Attributes as TodoItem
  }

  async deleteTodo(userId: string, todoId: string): Promise<Boolean> {
    logger.info({message: 'Delete todo', todoId: todoId, userId: userId})
 
    const params = {
      TableName: this.todosTable,
      Key: {
        userId,
        todoId
      },
      ConditionExpression: "attribute_exists(userId) AND attribute_exists(todoId)",
      ReturnValues: "ALL_OLD"
    }

    const result = await this.docClient.delete(params).promise();
    return !!result.Attributes;
  }

  /**
   * Validates if a todo exists.
   *
   * @param userId  Id of a user
   * @param todoId  Id of a todo
   * @returns  true if todo exists
   * @throws Error if todo does not exist
   */
  async validateTodoExists(userId: string, todoId: string): Promise<Boolean> {
    logger.info({message: 'Validate todo exists', todoId: todoId, userId: userId})
    const getParams = {
      TableName: this.todosTable,
      Key: {
        userId,
        todoId
      },
    }

    const result = await this.docClient.get(getParams).promise()

    if (!result.Item) {
      return false
    }

    return true
  }
}