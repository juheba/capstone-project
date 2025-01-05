# collector_api_client.model.Item

## Load the model package
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**itemId** | **String** | The id of the item. | 
**title** | **String** | The title of the item (e.g., the name of the book, movie, or comic). | 
**description** | **String** | A brief description or summary of the item. | [optional] 
**itemType** | **String** | The type of the item (e.g., book, movie, game, comic). | [optional] 
**userId** | **String** | The id of the user. | 
**addedAt** | [**DateTime**](DateTime.md) |  | 
**lastModified** | [**DateTime**](DateTime.md) |  | 
**attachmentUrl** | **String** | A upload url to attach a file to an item or location depending on the request parameter. | [optional] 
**locationId** | **String** | The id of the location. | [optional] 
**isLendable** | **bool** | Information about whether the user (owner) would lend the item. | 
**ownershipStatus** | [**ItemOwnershipStatusEnum**](ItemOwnershipStatusEnum.md) |  | 
**status** | [**ItemStatusEnum**](ItemStatusEnum.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


