//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:collector/generated/openapi/collector-api/model/collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_collections_response.g.dart';

/// ItemCollectionsResponse
///
/// Properties:
/// * [collections]
@BuiltValue()
abstract class ItemCollectionsResponse
    implements Built<ItemCollectionsResponse, ItemCollectionsResponseBuilder> {
  @BuiltValueField(wireName: r'collections')
  BuiltList<Collection> get collections;

  ItemCollectionsResponse._();

  factory ItemCollectionsResponse(
          [void updates(ItemCollectionsResponseBuilder b)]) =
      _$ItemCollectionsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ItemCollectionsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ItemCollectionsResponse> get serializer =>
      _$ItemCollectionsResponseSerializer();
}

class _$ItemCollectionsResponseSerializer
    implements PrimitiveSerializer<ItemCollectionsResponse> {
  @override
  final Iterable<Type> types = const [
    ItemCollectionsResponse,
    _$ItemCollectionsResponse
  ];

  @override
  final String wireName = r'ItemCollectionsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ItemCollectionsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'collections';
    yield serializers.serialize(
      object.collections,
      specifiedType: const FullType(BuiltList, [FullType(Collection)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ItemCollectionsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ItemCollectionsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'collections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Collection)]),
          ) as BuiltList<Collection>;
          result.collections.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ItemCollectionsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ItemCollectionsResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
