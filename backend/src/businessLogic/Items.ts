import { v4 as uuidv4 } from 'uuid';
import { Item, ItemsWithLastKey } from '@models/item'
import { ItemAccess } from '@dataLayer/itemAccess'
import { CreateItemRequest, UpdateItemRequest } from '@requests/item'
import { GetLimitNextKeyRequest } from '@requests/generel'

const itemAccess = new ItemAccess()

export async function getItemsForUser(userId: string, getLimitNextKeyRequest: GetLimitNextKeyRequest): Promise<ItemsWithLastKey> {
  return await itemAccess.getItemsForUser(userId, getLimitNextKeyRequest.limit, getLimitNextKeyRequest.nextKey)
}

export async function getItemsByIds(userId: string, itemsId: string[]): Promise<Item[]> {
  return await itemAccess.getItemsByIds(userId, itemsId)
}

export async function createItem(userId: string, createItemRequest: CreateItemRequest,): Promise <Item> {
  const itemId = uuidv4()
  const currentDate = new Date().toISOString()
  const item: Item = {
    userId,
    itemId,
    itemType: createItemRequest.itemType,
    title: createItemRequest.title,
    description: createItemRequest.description,
    image: createItemRequest.image,
    notes: createItemRequest.notes,
    rating: createItemRequest.rating,
    isLendable: createItemRequest.isLendable,
    ownershipStatus: createItemRequest.ownershipStatus,
    status: createItemRequest.status,
    addedAt: currentDate,
    lastModified: currentDate,
    locationId: createItemRequest.locationId
  }
  return await itemAccess.createItem(userId, item)
}

export async function updateItem(userId: string, itemId: string, updateItemRequest: UpdateItemRequest): Promise <Item> {
  const item = {
    userId,
    itemId,
    itemType: updateItemRequest.itemType,
    title: updateItemRequest.title,
    description: updateItemRequest.description,
    image: updateItemRequest.image,
    notes: updateItemRequest.notes,
    rating: updateItemRequest.rating,
    isLendable: updateItemRequest.isLendable,
    ownershipStatus: updateItemRequest.ownershipStatus,
    status: updateItemRequest.status,
    lastModified: new Date().toISOString(),
    locationId: updateItemRequest.locationId
  }
  return await itemAccess.updateItem(userId, item)
}

export async function deleteItem(userId: string, itemId: string): Promise<Boolean> {
  return await itemAccess.deleteItem(userId, itemId)
}

/**
 * Validates if a item exists.
 *
 * @param userId  Id of a user
 * @param itemId  Id of a item
 * @returns  true if item exists, false otherwise
 */
export async function validateItemExists(userId: string, itemId: string): Promise<Boolean> {
  return await itemAccess.validateItemExists(userId, itemId)
}
