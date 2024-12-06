# collector_api_client.api.CollectionApi

## Load the API package
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCollection**](CollectionApi.md#createcollection) | **POST** /collections | Create a new collection
[**deleteCollection**](CollectionApi.md#deletecollection) | **DELETE** /collections/{collectionId} | Delete collection
[**getCollectionItems**](CollectionApi.md#getcollectionitems) | **GET** /collections/{collectionId}/items | Get all items of a collection
[**getCollections**](CollectionApi.md#getcollections) | **GET** /collections | Get all collections
[**updateCollection**](CollectionApi.md#updatecollection) | **PATCH** /collections/{collectionId} | Update collection
[**updateCollectionItems**](CollectionApi.md#updatecollectionitems) | **POST** /collections/{collectionId}/items | Adds items to a collection.


# **createCollection**
> CollectionResponse createCollection(createCollectionRequest)

Create a new collection

Creates a new collection for a user

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getCollectionApi();
final CreateCollectionRequest createCollectionRequest = ; // CreateCollectionRequest | 

try {
    final response = api.createCollection(createCollectionRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->createCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCollectionRequest** | [**CreateCollectionRequest**](CreateCollectionRequest.md)|  | [optional] 

### Return type

[**CollectionResponse**](CollectionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCollection**
> deleteCollection(collectionId)

Delete collection

Deletes a collection of a user.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getCollectionApi();
final String collectionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the collection which will be deleted.

try {
    api.deleteCollection(collectionId);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->deleteCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collectionId** | **String**| ID of the collection which will be deleted. | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCollectionItems**
> CollectionItemsResponse getCollectionItems(collectionId)

Get all items of a collection

List all items from a collection.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getCollectionApi();
final String collectionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the collection.

try {
    final response = api.getCollectionItems(collectionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->getCollectionItems: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collectionId** | **String**| ID of the collection. | 

### Return type

[**CollectionItemsResponse**](CollectionItemsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCollections**
> CollectionsResponse getCollections(limit, nextKey)

Get all collections

Get all collections of a user

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getCollectionApi();
final num limit = 8.14; // num | (optional) Iterates over the collections with the given limit.
final String nextKey = nextKey_example; // String | (optional) Iterates over the collections with the given nextKey.

try {
    final response = api.getCollections(limit, nextKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->getCollections: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **num**| (optional) Iterates over the collections with the given limit. | [optional] 
 **nextKey** | **String**| (optional) Iterates over the collections with the given nextKey. | [optional] 

### Return type

[**CollectionsResponse**](CollectionsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCollection**
> CollectionResponse updateCollection(collectionId, updateCollectionRequest)

Update collection

Updates a collection with new informations.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getCollectionApi();
final String collectionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the collection which will receive the update.
final UpdateCollectionRequest updateCollectionRequest = ; // UpdateCollectionRequest | 

try {
    final response = api.updateCollection(collectionId, updateCollectionRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->updateCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collectionId** | **String**| ID of the collection which will receive the update. | 
 **updateCollectionRequest** | [**UpdateCollectionRequest**](UpdateCollectionRequest.md)|  | [optional] 

### Return type

[**CollectionResponse**](CollectionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCollectionItems**
> updateCollectionItems(collectionId, updateCollectionItemsRequest)

Adds items to a collection.

Adds one or multiple items to a collection.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getCollectionApi();
final String collectionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the collection which will receive the items.
final UpdateCollectionItemsRequest updateCollectionItemsRequest = ; // UpdateCollectionItemsRequest | Items to add to the collection.

try {
    api.updateCollectionItems(collectionId, updateCollectionItemsRequest);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->updateCollectionItems: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collectionId** | **String**| ID of the collection which will receive the items. | 
 **updateCollectionItemsRequest** | [**UpdateCollectionItemsRequest**](UpdateCollectionItemsRequest.md)| Items to add to the collection. | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

