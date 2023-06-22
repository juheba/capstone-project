import 'source-map-support/register'

import { APIGatewayTokenAuthorizerEvent, APIGatewayAuthorizerResult, APIGatewayAuthorizerHandler } from 'aws-lambda'

import Axios from 'axios'
import { verify, decode } from 'jsonwebtoken'
import { Jwt } from '../../auth/Jwt'
import { JwtPayload } from '../../auth/JwtPayload'

import { createLogger, middyfy } from '@utils'


const logger = createLogger('auth0Authorizer')

const jwksUrl = 'https://dev-znkiohxr.eu.auth0.com/.well-known/jwks.json'


const handler: APIGatewayAuthorizerHandler = async (event: APIGatewayTokenAuthorizerEvent): Promise<APIGatewayAuthorizerResult> => {
  logger.info("Processing authorizer event")

  let decodedToken;
  try {
    decodedToken = await verifyToken(event.authorizationToken)
    logger.info({message:'User is authorized', userId: decodedToken.sub})
    return buildAuthorizationResponse(decodedToken.sub)
  } catch (e) {
    logger.info({message:`User not authorized ${e.message}`, userId: decodedToken.sub})
    return buildUnauthorizedResponse()
  }
}

export const main = handler; //middyfy(handler);  // middyfy results in a invalid response: Authorization response did not include a principalId: (λ: Auth)

async function verifyToken(authHeader: string): Promise<JwtPayload> {
  const token = getToken(authHeader);
  const jwt: Jwt = decode(token, { complete: true }) as Jwt;

  // Implement token verification
  // You should implement it similarly to how it was implemented for the exercise for the lesson 5
  // You can read more about how to do this here: https://auth0.com/blog/navigating-rs256-and-jwks/

  try {
    const jwksResponse = await Axios.get(jwksUrl);
    const jwks = jwksResponse.data;

    // Find the key in JWKS based on the JWT header key ID (kid)
    const signingKey = jwks.keys.find((key: any) => key.kid === jwt.header.kid);

    if (!signingKey) {
      throw new Error('Unable to find signing key in JWKS');
    }

    const publicKey =  certToPEM(signingKey.x5c[0])

    // Verify the token using the retrieved public key
    const decoded = await verify(token, publicKey, { algorithms: ['RS256'] });

    return decoded as JwtPayload;
  } catch (error) {
    logger.error(`Error verifying token: ${error}`);
    throw error;
  }
}

function certToPEM(cert) {
  const pemHeader = '-----BEGIN CERTIFICATE-----\n';
  const pemFooter = '\n-----END CERTIFICATE-----\n';

  const chunks = cert.match(/.{1,64}/g);
  const pem = chunks.join('\n');

  return pemHeader + pem + pemFooter;
}

function getToken(authHeader: string): string {
  if (!authHeader) throw new Error('No authentication header')

  if (!authHeader.toLowerCase().startsWith('bearer '))
    throw new Error('Invalid authentication header')

  const split = authHeader.split(' ')
  const token = split[1]

  return token
}

function buildAuthorizationResponse(principalId: string): APIGatewayAuthorizerResult {
  const result: APIGatewayAuthorizerResult = {
    principalId,
    policyDocument: {
      Version: '2012-10-17',
      Statement: [
        {
          Action: 'execute-api:Invoke',
          Effect: 'Allow',
          Resource: '*',
        },
      ],
    }
  }
  return result
}

function buildUnauthorizedResponse(): APIGatewayAuthorizerResult {
  return {
    principalId: 'user',
    policyDocument: {
      Version: '2012-10-17',
      Statement: [
        {
          Action: 'execute-api:Invoke',
          Effect: 'Deny',
          Resource: '*',
        },
      ],
    },
  }
}