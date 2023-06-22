# Quickstart

## Backend

Requirements: 
* Node version > 18 - check via `node -v`
* Typescript version > 5 - check via `tsc -v`
* Serverless version > 3 - check via `sls -v`

```sh
npm i                 # classic install
sls dynamodb install  # installs dynamodb local
```
### 🟢 ONLINE
```sh
sls deploy    # deploy serverless template to aws
sls remove    # remove infrastructure and cloudformation template from aws
```
Attention! sls remove - Check if all created resources are deleted:
* GatewayResponseDefault4XX: 'AWS::ApiGateway::GatewayResponse'
* TodosTable: 'AWS::DynamoDB::Table'
* AttatchmentsBucket: 'AWS::S3::Bucket'
* BucketPolicy: 'AWS::S3::BucketPolicy'
* Lambda Functions

### 🔴 OFFLINE
Execute both commands in seperate terminals:
```sh
sls offline  # local deployment hosted on http://localhost:3003
sls dynamodb start  # start dynamodb hosted on http://localhost:8000
```


## Frontend

Requirements: 
* TODO:

```sh
# set base url in config.ts
npm run start  # hosts on http://localhost:3000/
```

# How to interact with dynamodb without dynamodbs shell
```sh
aws dynamodb help                                              # Help
aws dynamodb list-tables --endpoint-url http://localhost:8000  # List all tables
aws dynamodb describe-table --endpoint-url http://localhost:8000 --table-name todos-dev  # Describe a table by name (with item count)
```



# Usage

You can create, retrieve, update, or delete todos with the following commands.

* Replace <api-id> with the generated api id listed in your terminal after executing `sls deploy`.
* If `sls offline` is running, then you need to replace the host with `http://localhost:3003`

## Create a Todo

```bash
curl -X POST https://<api-id>.execute-api.eu-central-1.amazonaws.com/dev/todos --data '{ "text": "Learn Serverless" }'
```

Example Result:
```bash
{"text":"Learn Serverless","id":"ee6490d0-aa11e6-9ede-afdfa051af86","createdAt":1479138570824,"checked":false,"updatedAt":1479138570824}%
```

## List all Todos

```bash
curl https://<api-id>.execute-api.eu-central-1.amazonaws.com/dev/todos
```

Example output:
```bash
[{"text":"Deploy my first service","id":"ac90feaa11e6-9ede-afdfa051af86","checked":true,"updatedAt":1479139961304},{"text":"Learn Serverless","id":"206793aa11e6-9ede-afdfa051af86","createdAt":1479139943241,"checked":false,"updatedAt":1479139943241}]%
```

## Get one Todo

```bash
# Replace the <todosId> part with a real id from your todos table
curl https://<api-id>.execute-api.eu-central-1.amazonaws.com/dev/todos/<todosId>
```

Example Result:
```bash
{"text":"Learn Serverless","id":"ee6490d0-aa11e6-9ede-afdfa051af86","createdAt":1479138570824,"checked":false,"updatedAt":1479138570824}%
```

## Update a Todo

```bash
# Replace the <todosId> part with a real id from your todos table
curl -X PATCH https://<api-id>.execute-api.eu-central-1.amazonaws.com/dev/todos/<todosId> --data '{ "text": "Learn Serverless", "checked": true }'
```

Example Result:
```bash
{"text":"Learn Serverless","id":"ee6490d0-aa11e6-9ede-afdfa051af86","createdAt":1479138570824,"checked":true,"updatedAt":1479138570824}%
```
