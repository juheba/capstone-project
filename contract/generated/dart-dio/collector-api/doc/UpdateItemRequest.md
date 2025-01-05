# collector_api_client.model.UpdateItemRequest

## Load the model package
```dart
import 'package:collector/generated/openapi/collector-api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**title** | **String** | The title of the item (e.g., the name of the book, movie, or comic). | 
**itemType** | **String** | The type of the item (e.g., book, movie, game, comic). | [optional] 
**description** | **String** | A brief description or summary of the item. | [optional] 
**locationId** | **String** | The id of the location. | [optional] 
**isLendable** | **bool** | Information about whether the user (owner) would lend the item. | 
**ownershipStatus** | [**ItemOwnershipStatusEnum**](ItemOwnershipStatusEnum.md) |  | 
**status** | [**ItemStatusEnum**](ItemStatusEnum.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


