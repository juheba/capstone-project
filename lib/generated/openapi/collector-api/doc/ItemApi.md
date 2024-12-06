# collector_api_client.api.ItemApi

## Load the API package
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createItem**](ItemApi.md#createitem) | **POST** /items | Create a new item
[**deleteItem**](ItemApi.md#deleteitem) | **DELETE** /items/{itemId} | Delete item
[**getItemCollections**](ItemApi.md#getitemcollections) | **GET** /items/{itemId}/collections | Get all collections of a item
[**getItems**](ItemApi.md#getitems) | **GET** /items | Get all items
[**updateItem**](ItemApi.md#updateitem) | **PATCH** /items/{itemId} | Update item
[**updateItemCollections**](ItemApi.md#updateitemcollections) | **POST** /items/{itemId}/collections | Adds collections to an item.


# **createItem**
> ItemResponse createItem(createItemRequest)

Create a new item

Creates a new item for a user

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getItemApi();
final CreateItemRequest createItemRequest = ; // CreateItemRequest | 

try {
    final response = api.createItem(createItemRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemApi->createItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createItemRequest** | [**CreateItemRequest**](CreateItemRequest.md)|  | [optional] 

### Return type

[**ItemResponse**](ItemResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteItem**
> deleteItem(itemId)

Delete item

Deletes a item of a user.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getItemApi();
final String itemId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the item which will be deleted.

try {
    api.deleteItem(itemId);
} catch on DioException (e) {
    print('Exception when calling ItemApi->deleteItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemId** | **String**| ID of the item which will be deleted. | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemCollections**
> ItemCollectionsResponse getItemCollections(itemId)

Get all collections of a item

List all collections an item is assigned to.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getItemApi();
final String itemId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the item.

try {
    final response = api.getItemCollections(itemId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemApi->getItemCollections: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemId** | **String**| ID of the item. | 

### Return type

[**ItemCollectionsResponse**](ItemCollectionsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItems**
> ItemsResponse getItems(limit, nextKey)

Get all items

Get all itemss of a user

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getItemApi();
final num limit = 8.14; // num | (optional) Iterates over the collections with the given limit.
final String nextKey = nextKey_example; // String | (optional) Iterates over the collections with the given nextKey.

try {
    final response = api.getItems(limit, nextKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemApi->getItems: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **num**| (optional) Iterates over the collections with the given limit. | [optional] 
 **nextKey** | **String**| (optional) Iterates over the collections with the given nextKey. | [optional] 

### Return type

[**ItemsResponse**](ItemsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateItem**
> ItemResponse updateItem(itemId, updateItemRequest)

Update item

Updates a item with new informations.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getItemApi();
final String itemId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the item which will receive the update.
final UpdateItemRequest updateItemRequest = ; // UpdateItemRequest | 

try {
    final response = api.updateItem(itemId, updateItemRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemApi->updateItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemId** | **String**| ID of the item which will receive the update. | 
 **updateItemRequest** | [**UpdateItemRequest**](UpdateItemRequest.md)|  | [optional] 

### Return type

[**ItemResponse**](ItemResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateItemCollections**
> updateItemCollections(itemId, updateCollectionItemsRequest)

Adds collections to an item.

Adds one or multiple collections to an item.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getItemApi();
final String itemId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the item which will receive the collections.
final UpdateCollectionItemsRequest updateCollectionItemsRequest = ; // UpdateCollectionItemsRequest | Collections to add to the item.

try {
    api.updateItemCollections(itemId, updateCollectionItemsRequest);
} catch on DioException (e) {
    print('Exception when calling ItemApi->updateItemCollections: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemId** | **String**| ID of the item which will receive the collections. | 
 **updateCollectionItemsRequest** | [**UpdateCollectionItemsRequest**](UpdateCollectionItemsRequest.md)| Collections to add to the item. | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

