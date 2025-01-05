# Cloud Capstone Project

This project is part of the Udacity Cloud Developer Nanodegree program and serves as a capstone project.
It is an educational project designed to demonstrate the skills and knowledge acquired during the nanodegree.
For more information about the program, visit [Udacity Cloud Developer Nanodegree](https://www.udacity.com/course/cloud-developer-nanodegree--nd9990?promo=savemore&coupon=HOLIDAY40&utm_source=gsem_brand&utm_medium=ads_r&utm_campaign=19692269004_c_individuals&utm_term=151372115492&utm_keyword=nanodegree%20cloud_e&utm_source=gsem_brand&utm_medium=ads_r&utm_campaign=19692269004_c_individuals&utm_term=151372115492&utm_keyword=nanodegree%20cloud_e&gad_source=1&gclid=CjwKCAiA65m7BhAwEiwAAgu4JKW0pO8Z1BLC16i5LluaZntA1OY0h9oZLCtXPUjgII30Thp2WUUC-hoCkYIQAvD_BwE).


# Collector App

Collector App is an application designed to help users manage their collections of items.
The backend is built using a serverless architecture on AWS, leveraging services like AWS Lambda, API Gateway, DynamoDB, and S3.
The frontend is developed using Flutter, providing a seamless experience on both web and Android platforms.
The application includes authentication using Auth0 and API documentation with OpenAPI.
With features like item and collection management, location tracking, and detailed analytics, Collector App provides a tool for collectors to organize and track their collections efficiently.

## Features

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
* An OpenApi 3 contract can be found in .... TODO.
* It documents the api and makes the rest client implementation easier.
* Uses OpenAPI Generator to generate a flutter dio rest client.

**Testing**
* Integration tests ensure that the api work as expected.
* These tests are implmented and executed using the [Postman collection](./postman/).

## Getting Started
* Backend: For detailed information about the backend setup, including environment configuration, architecture diagram, API endpoints, and more, please refer to the [Backend README.md](./backend/README.md).
* Contract: For detailed API documentation, refer to the [OpenApi contract](./contract/specs/collector-openapi.yml).
* Frontend: Visit the frontend repository at [Collector App Respository](https://github.com/juheba/collector-app).


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