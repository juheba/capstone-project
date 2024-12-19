//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_collection_items_request_one_of1.g.dart';

/// UpdateCollectionItemsRequestOneOf1
///
/// Properties:
/// * [collectionIds]
@BuiltValue()
abstract class UpdateCollectionItemsRequestOneOf1
    implements
        Built<UpdateCollectionItemsRequestOneOf1,
            UpdateCollectionItemsRequestOneOf1Builder> {
  @BuiltValueField(wireName: r'collectionIds')
  BuiltList<String> get collectionIds;

  UpdateCollectionItemsRequestOneOf1._();

  factory UpdateCollectionItemsRequestOneOf1(
          [void updates(UpdateCollectionItemsRequestOneOf1Builder b)]) =
      _$UpdateCollectionItemsRequestOneOf1;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCollectionItemsRequestOneOf1Builder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCollectionItemsRequestOneOf1> get serializer =>
      _$UpdateCollectionItemsRequestOneOf1Serializer();
}

class _$UpdateCollectionItemsRequestOneOf1Serializer
    implements PrimitiveSerializer<UpdateCollectionItemsRequestOneOf1> {
  @override
  final Iterable<Type> types = const [
    UpdateCollectionItemsRequestOneOf1,
    _$UpdateCollectionItemsRequestOneOf1
  ];

  @override
  final String wireName = r'UpdateCollectionItemsRequestOneOf1';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCollectionItemsRequestOneOf1 object, {
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
    UpdateCollectionItemsRequestOneOf1 object, {
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
    required UpdateCollectionItemsRequestOneOf1Builder result,
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
  UpdateCollectionItemsRequestOneOf1 deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCollectionItemsRequestOneOf1Builder();
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
