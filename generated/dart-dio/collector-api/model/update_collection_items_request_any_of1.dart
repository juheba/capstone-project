//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_collection_items_request_any_of1.g.dart';

/// UpdateCollectionItemsRequestAnyOf1
///
/// Properties:
/// * [collectionIds]
@BuiltValue()
abstract class UpdateCollectionItemsRequestAnyOf1
    implements
        Built<UpdateCollectionItemsRequestAnyOf1,
            UpdateCollectionItemsRequestAnyOf1Builder> {
  @BuiltValueField(wireName: r'collectionIds')
  BuiltList<String> get collectionIds;

  UpdateCollectionItemsRequestAnyOf1._();

  factory UpdateCollectionItemsRequestAnyOf1(
          [void updates(UpdateCollectionItemsRequestAnyOf1Builder b)]) =
      _$UpdateCollectionItemsRequestAnyOf1;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCollectionItemsRequestAnyOf1Builder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCollectionItemsRequestAnyOf1> get serializer =>
      _$UpdateCollectionItemsRequestAnyOf1Serializer();
}

class _$UpdateCollectionItemsRequestAnyOf1Serializer
    implements PrimitiveSerializer<UpdateCollectionItemsRequestAnyOf1> {
  @override
  final Iterable<Type> types = const [
    UpdateCollectionItemsRequestAnyOf1,
    _$UpdateCollectionItemsRequestAnyOf1
  ];

  @override
  final String wireName = r'UpdateCollectionItemsRequestAnyOf1';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCollectionItemsRequestAnyOf1 object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'collectionIds';
    yield serializers.serialize(
      object.collectionIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateCollectionItemsRequestAnyOf1 object, {
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
    required UpdateCollectionItemsRequestAnyOf1Builder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'collectionIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.collectionIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateCollectionItemsRequestAnyOf1 deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCollectionItemsRequestAnyOf1Builder();
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
