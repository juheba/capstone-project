# collector_api_client.api.LocationApi

## Load the API package
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createLocation**](LocationApi.md#createlocation) | **POST** /locations | Create a new location
[**deleteLocation**](LocationApi.md#deletelocation) | **DELETE** /locations/{locationId} | Delete location
[**getLocations**](LocationApi.md#getlocations) | **GET** /locations | Get all locations
[**updateLocation**](LocationApi.md#updatelocation) | **PATCH** /locations/{locationId} | Update location


# **createLocation**
> LocationResponse createLocation(createLocationRequest)

Create a new location

Creates a new location for a user

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getLocationApi();
final CreateLocationRequest createLocationRequest = ; // CreateLocationRequest | 

try {
    final response = api.createLocation(createLocationRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LocationApi->createLocation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createLocationRequest** | [**CreateLocationRequest**](CreateLocationRequest.md)|  | [optional] 

### Return type

[**LocationResponse**](LocationResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteLocation**
> deleteLocation(locationId)

Delete location

Deletes a location of a user.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getLocationApi();
final String locationId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the location which will be deleted.

try {
    api.deleteLocation(locationId);
} catch on DioException (e) {
    print('Exception when calling LocationApi->deleteLocation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **locationId** | **String**| ID of the location which will be deleted. | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLocations**
> LocationsResponse getLocations(limit, nextKey)

Get all locations

Get all locations of a user

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getLocationApi();
final num limit = 8.14; // num | (optional) Iterates over the collections with the given limit.
final String nextKey = nextKey_example; // String | (optional) Iterates over the collections with the given nextKey.

try {
    final response = api.getLocations(limit, nextKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LocationApi->getLocations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **num**| (optional) Iterates over the collections with the given limit. | [optional] 
 **nextKey** | **String**| (optional) Iterates over the collections with the given nextKey. | [optional] 

### Return type

[**LocationsResponse**](LocationsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateLocation**
> LocationResponse updateLocation(locationId, updateLocationRequest)

Update location

Updates a location with new informations.

### Example
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';

final api = CollectorApiClient().getLocationApi();
final String locationId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the location which will receive the update.
final UpdateLocationRequest updateLocationRequest = ; // UpdateLocationRequest | 

try {
    final response = api.updateLocation(locationId, updateLocationRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LocationApi->updateLocation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **locationId** | **String**| ID of the location which will receive the update. | 
 **updateLocationRequest** | [**UpdateLocationRequest**](UpdateLocationRequest.md)|  | [optional] 

### Return type

[**LocationResponse**](LocationResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

