import { v4 as uuidv4 } from 'uuid';
import { TodoItem } from '../models/TodoItem'
import { TodosWithLastKey } from "../models/TodosWithLastKey";
import { TodoAccess } from '../dataLayer/todoAccess'
import { AttachmentsAccess } from '../dataLayer/attachmentsAccess'
import { GetTodosRequest } from '../requests/GetTodosRequest'
import { CreateTodoRequest } from '../requests/CreateTodoRequest'
import { UpdateTodoRequest } from '../requests/UpdateTodoRequest'

const todoAccess = new TodoAccess()
const attachmentsAccess = new AttachmentsAccess()

export async function getTodosForUser(userId: string, getTodosRequest: GetTodosRequest): Promise<TodosWithLastKey> {
  return await todoAccess.getTodosForUser(userId, getTodosRequest.limit, getTodosRequest.nextKey)
}

export async function createTodo(userId: string, createTodoRequest: CreateTodoRequest,): Promise <TodoItem> {
  const todoId = uuidv4()
  const todo: TodoItem = {
    userId,
    todoId,
    createdAt: new Date().toISOString(),
    name: createTodoRequest.name,
    dueDate: createTodoRequest.dueDate,
    done: false
  }
  return await todoAccess.createTodo(userId, todo)
}

export async function createAttachmentPresignedUrl(userId: string, todoId: string) {
  const attachmentId = uuidv4()

  const attachmentUrl = attachmentsAccess.getAttachmentUrl(attachmentId)
  await todoAccess.updateAttachmentUrl(userId, todoId, attachmentUrl)

  return await attachmentsAccess.getUploadUrl(userId, attachmentId)
}

export async function updateTodo(userId: string, todoId: string, updateTodoRequest: UpdateTodoRequest): Promise <TodoItem> {
  const todo = {
    todoId: todoId,
    name: updateTodoRequest.name,
    dueDate: updateTodoRequest.dueDate,
    done: updateTodoRequest.done
  }
  return await todoAccess.updateTodo(userId, todo)
}

export async function deleteTodo(userId: string, todoId: string): Promise<Boolean> {
  return await todoAccess.deleteTodo(userId, todoId)
}

/**
 * Validates if a todo exists.
 *
 * @param todoId  Id of a todo
 * @returns  true if todo exists
 * @throws Error if todo does not exist
 */
export async function validateTodoExists(userId: string, todoId: string): Promise<Boolean> {
  return await todoAccess.validateTodoExists(userId, todoId)
}