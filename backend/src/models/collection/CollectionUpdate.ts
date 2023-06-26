import Tag from '@models/Tag'
import { CollectionVisibility } from "@models/collection";

export interface CollectionUpdate {
  name: string
  description: string
  visibility: CollectionVisibility
  lastModified: string
  icon?: string  // TODO: no clue if i itegrate this feature
  tags?: Tag[]  // TODO: no clue if i itegrate this feature
}