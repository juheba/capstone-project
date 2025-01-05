//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:collector/generated/openapi/collector-api/model/item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_response.g.dart';

/// ItemResponse
///
/// Properties:
/// * [item]
@BuiltValue()
abstract class ItemResponse
    implements Built<ItemResponse, ItemResponseBuilder> {
  @BuiltValueField(wireName: r'item')
  Item get item;

  ItemResponse._();

  factory ItemResponse([void updates(ItemResponseBuilder b)]) = _$ItemResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ItemResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ItemResponse> get serializer => _$ItemResponseSerializer();
}

class _$ItemResponseSerializer implements PrimitiveSerializer<ItemResponse> {
  @override
  final Iterable<Type> types = const [ItemResponse, _$ItemResponse];

  @override
  final String wireName = r'ItemResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ItemResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'item';
    yield serializers.serialize(
      object.item,
      specifiedType: const FullType(Item),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ItemResponse object, {
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
    required ItemResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'item':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Item),
          ) as Item;
          result.item.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ItemResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ItemResponseBuilder();
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
