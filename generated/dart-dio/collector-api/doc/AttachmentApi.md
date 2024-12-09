# collector_api_client.api.AttachmentApi

## Load the API package
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**generateUploadUrl**](AttachmentApi.md#generateuploadurl) | **POST** /attachments | Generates an attachment upload url


# **generateUploadUrl**
> AttachmentURLResponse generateUploadUrl(generateUploadUrlRequest)

Generates an attachment upload url

Generates an upload url for an item or location attachment

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getAttachmentApi();
final GenerateUploadUrlRequest generateUploadUrlRequest = ; // GenerateUploadUrlRequest | Item or Location to attach a file to.

try {
    final response = api.generateUploadUrl(generateUploadUrlRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AttachmentApi->generateUploadUrl: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **generateUploadUrlRequest** | [**GenerateUploadUrlRequest**](GenerateUploadUrlRequest.md)| Item or Location to attach a file to. | 

### Return type

[**AttachmentURLResponse**](AttachmentURLResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

