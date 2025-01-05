//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_collection_items_request_one_of.g.dart';

/// UpdateCollectionItemsRequestOneOf
///
/// Properties:
/// * [itemIds]
@BuiltValue()
abstract class UpdateCollectionItemsRequestOneOf
    implements
        Built<UpdateCollectionItemsRequestOneOf,
            UpdateCollectionItemsRequestOneOfBuilder> {
  @BuiltValueField(wireName: r'itemIds')
  BuiltList<String> get itemIds;

  UpdateCollectionItemsRequestOneOf._();

  factory UpdateCollectionItemsRequestOneOf(
          [void updates(UpdateCollectionItemsRequestOneOfBuilder b)]) =
      _$UpdateCollectionItemsRequestOneOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCollectionItemsRequestOneOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCollectionItemsRequestOneOf> get serializer =>
      _$UpdateCollectionItemsRequestOneOfSerializer();
}

class _$UpdateCollectionItemsRequestOneOfSerializer
    implements PrimitiveSerializer<UpdateCollectionItemsRequestOneOf> {
  @override
  final Iterable<Type> types = const [
    UpdateCollectionItemsRequestOneOf,
    _$UpdateCollectionItemsRequestOneOf
  ];

  @override
  final String wireName = r'UpdateCollectionItemsRequestOneOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCollectionItemsRequestOneOf object, {
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
    UpdateCollectionItemsRequestOneOf object, {
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
    required UpdateCollectionItemsRequestOneOfBuilder result,
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
  UpdateCollectionItemsRequestOneOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCollectionItemsRequestOneOfBuilder();
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
