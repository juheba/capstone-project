
# Features

**Full-Stack Application**
* Backend:
  * API (AWS API Gateway, AWS Lambda), Event-driven architecture, Database (AWS DynamoDB), Blob Storage (S3 Bucket)
  * Serverless architecture: It auto-scales and is pay on demand. Only pay when in use.
  * This project is currently hosted in AWS.
* Frontend:
  * Flutter web and android app.
  * Uses Auth0 for authentication.

**Authentication with Auth0**
* The flutter frontend has a login & registration form
* Some lambda functions can only be executed via proper authorization

**API Documentation**
* Contract:
  * An OpenApi 3 contract can be found in .... TODO.
  * It documents the api and makes the rest client implementation easier.
  * Uses OpenAPI Generator to generate a flutter dio rest client.

**Testing**
* Integration tests ensure that the api work as expected.
* These tests are executed using the [Postman collection](./postman/).

# Getting Started
* see [Backend README.md](./backend/README.md) with the serverless project serving as backend api
* TODO: contract ...
* TODO: frontend ...

# Udacity Cloud Capstone Project Criterias

## (Option 2): Codebase
|   |Criteria|Submission Requirements|
|---|--------|-----------------------|
|✅|The code is split into multiple layers separating business logic from I/O related code.|Code of Lambda functions is split into multiple files/classes. The business logic of an application is separated from code for database access, file storage, and code related to AWS Lambda.|
|✅|Code is implemented using async/await and Promises without using callbacks.|To get results of asynchronous operations, a student is using async/await constructs instead of passing callbacks.|

## (Option 2): Best practices
|   |Criteria|Submission Requirements|
|---|--------|-----------------------|
|✅|All resources in the application are defined in the "serverless.yml" file|All resources needed by an application are defined in the "serverless.yml". A developer does not need to create them manually using AWS console.|
|✅|Each function has its own set of permissions.|Instead of defining all permissions under **provider/iamRoleStatements**, permissions are defined per function in the **functions** section of the "serverless.yml".|
|✅|Application has sufficient monitoring.|Application has at least some of the following:</p><ul><li>Distributed tracing is enabled</li><li>It has a sufficient amount of log statements</li><li>It generates application level metrics</li></ul>|
|✅|HTTP requests are validated|Incoming HTTP requests are validated either in Lambda handlers or using request validation in API Gateway. The latter can be done either using the **serverless-reqvalidator-plugin** or by providing request schemas in function definitions.|

## (Option 2): Architecture

|   |Criteria|Submission Requirements|
|---|--------|-----------------------|
|✅|Data is stored in a table with a composite key.|1:M (1 to many) relationship between users and items is modeled using a DynamoDB table that has a composite key with both partition and sort keys. Should be defined similar to this: <p>`KeySchema:`<br> `- AttributeName: partitionKey`</br>`  KeyType: HASH`</br>`- AttributeName: sortKey`</br>`  KeyType: RANGE`|
|✅|Scan operation is not used to read data from a database.|Items are fetched using the "query()" method and not "scan()" method (which is less efficient on large datasets)|