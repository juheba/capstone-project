import Tag from '@models/Tag'
import { ItemStatus, OwnershipStatus } from '@models/item'

export interface UpdateItemRequest {
  itemType: string
  title: string
  description?: string
  image?: string
  notes?: string
  rating?: string
  isLendable: boolean
  ownershipStatus: OwnershipStatus
  status: ItemStatus
  locationId?: string
  genre?: string  // TODO: no clue if i itegrate this feature
  creators?: string  // TODO: no clue if i itegrate this feature
  release?: string  // TODO: no clue if i itegrate this feature
  tags?: Tag[]  // TODO: no clue if i itegrate this feature
}