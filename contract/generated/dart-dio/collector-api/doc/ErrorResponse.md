# collector_api_client.model.ErrorResponse

## Load the model package
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**statusCode** | **num** | The http status code. | 
**errorCode** | **String** | An unique error code with an prefix that indicates the error type. | 
**type** | [**ErrorTypeEnum**](ErrorTypeEnum.md) |  | 
**message** | **String** | Short error message. | 
**details** | **String** | Additional details about the error (optional). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


