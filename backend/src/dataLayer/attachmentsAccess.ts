import { createLogger, initAWS } from '@utils'

const logger = createLogger('attatchmentsAccess')
const AWS = initAWS()

export class AttachmentsAccess {

  constructor(
    private readonly bucketName = process.env.ATTACHMENTS_S3_BUCKET,
    private readonly s3 = new AWS.S3({signatureVersion: 'v4'}),
    private readonly urlExpiration = parseInt(process.env.SIGNED_URL_EXPIRATION)) {
  }

  getAttachmentUrl(attachmentId: string) {
    return `https://${this.bucketName}.s3.amazonaws.com/${attachmentId}`
  }

  async getUploadUrl(userId: string, attachmentId: string) {
    logger.info({message: 'Perform S3 PUT operation', userId: userId, attachmentId: attachmentId})
    return this.s3.getSignedUrl('putObject', {  // The URL will allow to perform the PUT operation
      Bucket: this.bucketName,
      Key: attachmentId,
      Expires: this.urlExpiration
    })
  }

}