import Tag from '@models/Tag'
import { CollectionVisibility } from '@models/collection'

export interface UpdateCollectionRequest {
  name: string
  description?: string
  visibility: CollectionVisibility
  icon?: string  // TODO: no clue if i itegrate this feature
  tags?: Tag[]  // TODO: no clue if i itegrate this feature
}