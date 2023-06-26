import { v4 as uuidv4 } from 'uuid';
import { Collection, CollectionsWithLastKey } from '@models/collection'
import { CollectionAccess } from '@dataLayer/collectionAccess'
import { GetCollectionsRequest, CreateCollectionRequest, UpdateCollectionRequest } from '@requests/collection'

const collectionAccess = new CollectionAccess()

export async function getCollectionsForUser(userId: string, getCollectionsRequest: GetCollectionsRequest): Promise<CollectionsWithLastKey> {
  return await collectionAccess.getCollectionsForUser(userId, getCollectionsRequest.limit, getCollectionsRequest.nextKey)
}

export async function createCollection(userId: string, createCollectionRequest: CreateCollectionRequest,): Promise <Collection> {
  const collectionId = uuidv4()
  const currentDate = new Date().toISOString()
  const collection: Collection = {
    userId,
    collectionId,
    name: createCollectionRequest.name,
    description: createCollectionRequest.description,
    visibility: createCollectionRequest.visibility,
    createdAt: currentDate,
    lastModified: currentDate
  }
  return await collectionAccess.createCollection(userId, collection)
}

export async function updateCollection(userId: string, collectionId: string, updateCollectionRequest: UpdateCollectionRequest): Promise <Collection> {
  const collection = {
    collectionId: collectionId,
    name: updateCollectionRequest.name,
    description: updateCollectionRequest.description,
    visibility: updateCollectionRequest.visibility,
    lastModified: new Date().toISOString()
  }
  return await collectionAccess.updateCollection(userId, collection)
}

export async function deleteCollection(userId: string, collectionId: string): Promise<Boolean> {
  return await collectionAccess.deleteCollection(userId, collectionId)
}

/**
 * Validates if a collection exists.
 *
 * @param userId  Id of a user
 * @param collectionId  Id of a collection
 * @returns  true if collection exists, false otherwise
 */
export async function validateCollectionExists(userId: string, collectionId: string): Promise<Boolean> {
  return await collectionAccess.validateCollectionExists(userId, collectionId)
}