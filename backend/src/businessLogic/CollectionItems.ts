import { CollectionItemAccess } from '@dataLayer/collectionItemAccess'
import { GetLimitNextKeyRequest } from '@requests/generel'
import { ItemsWithLastKey } from '@models/item'
import { getItemsByIds } from '@businessLogic/Items';
import { getCollectionsByIds } from './Collections';
import { CollectionsWithLastKey } from '@models/collection';

const collectionItemAccess = new CollectionItemAccess()

export async function getItemsForCollection(userId: string, collectionId: string, getLimitNextKeyRequest: GetLimitNextKeyRequest): Promise<ItemsWithLastKey> {
  const result = await collectionItemAccess.getItemsForCollection(userId, collectionId, getLimitNextKeyRequest.limit, getLimitNextKeyRequest.nextKey)
  const items = await getItemsByIds(userId, result.itemIds)
  return {
    items,
    lastKey: result.lastKey
  }
}

export async function updateCollectionItems(userId: string, collectionId: string, itemIds: string[]): Promise <Boolean> {
  return await collectionItemAccess.updateCollectionRelationships(userId, collectionId, itemIds)
}

export async function getCollectionsForItem(userId: string, itemId: string, getLimitNextKeyRequest: GetLimitNextKeyRequest): Promise<CollectionsWithLastKey> {
  const result = await collectionItemAccess.getCollectionsForItem(userId, itemId, getLimitNextKeyRequest.limit, getLimitNextKeyRequest.nextKey)
  const collections = await getCollectionsByIds(userId, result.collectionIds)
  return {
    collections,
    lastKey: result.lastKey
  }
}

export async function updateItemCollections(userId: string, itemId: string, collectionIds: string[]): Promise <Boolean> {
  return await collectionItemAccess.updateItemRelationships(userId, itemId, collectionIds)
}