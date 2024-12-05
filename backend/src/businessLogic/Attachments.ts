import { v4 as uuidv4 } from 'uuid';
import { AttachmentsAccess } from '@dataLayer/attachmentsAccess'
import { updateAttachmentUrl as updateItemAttachmentUrl } from '@businessLogic/Items';
import { updateAttachmentUrl as updateLocationAttachmentUrl } from '@businessLogic/Locations';
import { CreateAttachmentRequest } from '@requests/attachment'

const attachmentsAccess = new AttachmentsAccess()

export async function createAttachmentPresignedUrl(userId: string, attachment: CreateAttachmentRequest) {
  const attachmentId = uuidv4()

  const attachmentUrl = attachmentsAccess.getAttachmentUrl(attachmentId)

  if (attachment.itemId !== undefined) {
    await updateItemAttachmentUrl(userId, attachment.itemId, attachmentUrl)
  } else if (attachment.locationId !== undefined) {
    await updateLocationAttachmentUrl(userId, attachment.locationId, attachmentUrl)
  } else {
    throw new Error('\'itemId\' or \'locationId\' is missing.')
  }

  return await attachmentsAccess.getUploadUrl(userId, attachmentId)
}