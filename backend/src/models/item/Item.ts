import Tag from '@models/Tag'

export interface Item {
  userId,
  itemId: string
  itemType: string
  title: string
  description?: string
  image?: string
  notes?: string
  rating?: string
  isLendable: boolean
  ownershipStatus: OwnershipStatus
  status: ItemStatus
  addedAt: string
  lastModified?: string
  locationId?: string
  genre?: string  // TODO: no clue if i itegrate this feature
  creators?: string  // TODO: no clue if i itegrate this feature
  release?: string  // TODO: no clue if i itegrate this feature
  tags?: Tag[]  // TODO: no clue if i itegrate this feature
}

export enum OwnershipStatus {
  OWNER,
  BORROWER,
  WISHLIST,
}

export enum ItemStatus {
  TODO,
  PROCESSING,
  DONE
}