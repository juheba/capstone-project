export interface Lending {
  lendingId: string
  lenderUser: LenderUser
  borrowerUser: BorrowerUser
  itemId: string
  lentAt: string
  toReturnAt: string
  returnedAt: string
  status: LendingStatus
}

export interface AnonymousUser {
  name: string
  email: string
}

export interface LenderUser {
  lenderUserId?: string
  anonymousLender?: AnonymousUser
  isAnonymous: boolean
}

export interface BorrowerUser {
  borrowerUserId?: string
  anonymousBorrower?: AnonymousUser
  isAnonymous: boolean
}

export enum LendingStatus {
  LENDING,
  RETURNED
}