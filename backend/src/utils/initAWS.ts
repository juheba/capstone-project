
export function initAWS() {
  if (process.env.IS_OFFLINE) {
    return require('aws-sdk');
  } else {
    const AWSXRay = require('aws-xray-sdk');
    return AWSXRay.captureAWS(require('aws-sdk'));
  }
}