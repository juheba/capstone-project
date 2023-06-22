const AWSXRay = require('aws-xray-sdk');
const AWS = AWSXRay.captureAWS(require('aws-sdk'));

export class AttachmentsAccess {

  constructor(
    private readonly bucketName = process.env.ATTACHMENTS_S3_BUCKET,
    private readonly s3 = new AWS.S3({signatureVersion: 'v4'}),
    private readonly urlExpiration = parseInt(process.env.SIGNED_URL_EXPIRATION)) {
  }

  getAttachmentUrl(attachmentId: string) {
    return `https://${this.bucketName}.s3.amazonaws.com/${attachmentId}`
  }

  async getUploadUrl(attachmentId: string) {
    return this.s3.getSignedUrl('putObject', {  // The URL will allow to perform the PUT operation
      Bucket: this.bucketName,
      Key: attachmentId,
      Expires: this.urlExpiration
    })
  }

}