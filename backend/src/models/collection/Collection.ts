import Tag from '@models/Tag'

export interface Collection {
  collectionId: string
  userId: string
  name: string
  description?: string
  visibility: CollectionVisibility
  createdAt: string
  lastModified: string
  icon?: string  // TODO: no clue if i itegrate this feature
  tags?: Tag[]  // TODO: no clue if i itegrate this feature
}

export enum CollectionVisibility {
  PRIVATE,
  PUBLIC
}