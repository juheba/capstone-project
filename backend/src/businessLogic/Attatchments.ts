import { v4 as uuidv4 } from 'uuid';
import { AttachmentsAccess } from '@dataLayer/attachmentsAccess'
import { updateAttachmentUrl as updateItemAttachmentUrl } from '@businessLogic/Items';
import { updateAttachmentUrl as updateLocationAttachmentUrl } from '@businessLogic/Locations';
import { CreateAttatchmentRequest } from '@requests/attatchment'

const attachmentsAccess = new AttachmentsAccess()

export async function createAttachmentPresignedUrl(userId: string, attatchment: CreateAttatchmentRequest) {
  const attachmentId = uuidv4()

  const attachmentUrl = attachmentsAccess.getAttachmentUrl(attachmentId)

  if (attatchment.itemId !== undefined) {
    await updateItemAttachmentUrl(userId, attatchment.itemId, attachmentUrl)
  } else if (attatchment.locationId !== undefined) {
    await updateLocationAttachmentUrl(userId, attatchment.locationId, attachmentUrl)
  } else {
    throw new Error('\'itemId\' or \'locationId\' is missing.')
  }

  return await attachmentsAccess.getUploadUrl(userId, attachmentId)
}