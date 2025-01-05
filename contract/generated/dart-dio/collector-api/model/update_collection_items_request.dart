//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:collector/generated/openapi/collector-api/model/update_collection_items_request_one_of1.dart';
import 'package:collector/generated/openapi/collector-api/model/update_collection_items_request_one_of.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'update_collection_items_request.g.dart';

/// UpdateCollectionItemsRequest
///
/// Properties:
/// * [itemIds]
/// * [collectionIds]
@BuiltValue()
abstract class UpdateCollectionItemsRequest
    implements
        Built<UpdateCollectionItemsRequest,
            UpdateCollectionItemsRequestBuilder> {
  /// One Of [UpdateCollectionItemsRequestOneOf], [UpdateCollectionItemsRequestOneOf1]
  OneOf get oneOf;

  UpdateCollectionItemsRequest._();

  factory UpdateCollectionItemsRequest(
          [void updates(UpdateCollectionItemsRequestBuilder b)]) =
      _$UpdateCollectionItemsRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCollectionItemsRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCollectionItemsRequest> get serializer =>
      _$UpdateCollectionItemsRequestSerializer();
}

class _$UpdateCollectionItemsRequestSerializer
    implements PrimitiveSerializer<UpdateCollectionItemsRequest> {
  @override
  final Iterable<Type> types = const [
    UpdateCollectionItemsRequest,
    _$UpdateCollectionItemsRequest
  ];

  @override
  final String wireName = r'UpdateCollectionItemsRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCollectionItemsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    UpdateCollectionItemsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  UpdateCollectionItemsRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCollectionItemsRequestBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [
      FullType(UpdateCollectionItemsRequestOneOf),
      FullType(UpdateCollectionItemsRequestOneOf1),
    ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc,
        specifiedType: targetType) as OneOf;
    return result.build();
  }
}
