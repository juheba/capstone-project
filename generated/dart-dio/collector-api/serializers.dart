//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:collector/generated/openapi/collector-api/date_serializer.dart';
import 'package:collector/generated/openapi/collector-api/model/date.dart';

import 'package:collector/generated/openapi/collector-api/model/attachment_url_response.dart';
import 'package:collector/generated/openapi/collector-api/model/collection.dart';
import 'package:collector/generated/openapi/collector-api/model/collection_items_response.dart';
import 'package:collector/generated/openapi/collector-api/model/collection_response.dart';
import 'package:collector/generated/openapi/collector-api/model/collection_visibility_enum.dart';
import 'package:collector/generated/openapi/collector-api/model/collections_response.dart';
import 'package:collector/generated/openapi/collector-api/model/create_attachment_request.dart';
import 'package:collector/generated/openapi/collector-api/model/create_attachment_request_any_of.dart';
import 'package:collector/generated/openapi/collector-api/model/create_attachment_request_any_of1.dart';
import 'package:collector/generated/openapi/collector-api/model/create_collection_request.dart';
import 'package:collector/generated/openapi/collector-api/model/create_item_request.dart';
import 'package:collector/generated/openapi/collector-api/model/create_location_request.dart';
import 'package:collector/generated/openapi/collector-api/model/error_response.dart';
import 'package:collector/generated/openapi/collector-api/model/item.dart';
import 'package:collector/generated/openapi/collector-api/model/item_collections_response.dart';
import 'package:collector/generated/openapi/collector-api/model/item_ownership_status_enum.dart';
import 'package:collector/generated/openapi/collector-api/model/item_response.dart';
import 'package:collector/generated/openapi/collector-api/model/item_status_enum.dart';
import 'package:collector/generated/openapi/collector-api/model/items_response.dart';
import 'package:collector/generated/openapi/collector-api/model/location.dart';
import 'package:collector/generated/openapi/collector-api/model/location_response.dart';
import 'package:collector/generated/openapi/collector-api/model/locations_response.dart';
import 'package:collector/generated/openapi/collector-api/model/update_collection_items_request.dart';
import 'package:collector/generated/openapi/collector-api/model/update_collection_items_request_any_of.dart';
import 'package:collector/generated/openapi/collector-api/model/update_collection_items_request_any_of1.dart';
import 'package:collector/generated/openapi/collector-api/model/update_collection_request.dart';
import 'package:collector/generated/openapi/collector-api/model/update_item_request.dart';
import 'package:collector/generated/openapi/collector-api/model/update_location_request.dart';

part 'serializers.g.dart';

@SerializersFor([
  AttachmentURLResponse,
  Collection,
  CollectionItemsResponse,
  CollectionResponse,
  CollectionVisibilityEnum,
  CollectionsResponse,
  CreateAttachmentRequest,
  CreateAttachmentRequestAnyOf,
  CreateAttachmentRequestAnyOf1,
  CreateCollectionRequest,
  CreateItemRequest,
  CreateLocationRequest,
  ErrorResponse,
  Item,
  ItemCollectionsResponse,
  ItemOwnershipStatusEnum,
  ItemResponse,
  ItemStatusEnum,
  ItemsResponse,
  Location,
  LocationResponse,
  LocationsResponse,
  UpdateCollectionItemsRequest,
  UpdateCollectionItemsRequestAnyOf,
  UpdateCollectionItemsRequestAnyOf1,
  UpdateCollectionRequest,
  UpdateItemRequest,
  UpdateLocationRequest,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
