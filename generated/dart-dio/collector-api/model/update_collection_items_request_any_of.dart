//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_collection_items_request_any_of.g.dart';

/// UpdateCollectionItemsRequestAnyOf
///
/// Properties:
/// * [itemIds]
@BuiltValue()
abstract class UpdateCollectionItemsRequestAnyOf
    implements
        Built<UpdateCollectionItemsRequestAnyOf,
            UpdateCollectionItemsRequestAnyOfBuilder> {
  @BuiltValueField(wireName: r'itemIds')
  BuiltList<String> get itemIds;

  UpdateCollectionItemsRequestAnyOf._();

  factory UpdateCollectionItemsRequestAnyOf(
          [void updates(UpdateCollectionItemsRequestAnyOfBuilder b)]) =
      _$UpdateCollectionItemsRequestAnyOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCollectionItemsRequestAnyOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCollectionItemsRequestAnyOf> get serializer =>
      _$UpdateCollectionItemsRequestAnyOfSerializer();
}

class _$UpdateCollectionItemsRequestAnyOfSerializer
    implements PrimitiveSerializer<UpdateCollectionItemsRequestAnyOf> {
  @override
  final Iterable<Type> types = const [
    UpdateCollectionItemsRequestAnyOf,
    _$UpdateCollectionItemsRequestAnyOf
  ];

  @override
  final String wireName = r'UpdateCollectionItemsRequestAnyOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCollectionItemsRequestAnyOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'itemIds';
    yield serializers.serialize(
      object.itemIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateCollectionItemsRequestAnyOf object, {
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
    required UpdateCollectionItemsRequestAnyOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'itemIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.itemIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateCollectionItemsRequestAnyOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCollectionItemsRequestAnyOfBuilder();
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
