//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:collector/generated/openapi/collector-api/model/item.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'items_response.g.dart';

/// ItemsResponse
///
/// Properties:
/// * [items]
/// * [nextKey] - The next key to be used for pagination.
@BuiltValue()
abstract class ItemsResponse
    implements Built<ItemsResponse, ItemsResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<Item> get items;

  /// The next key to be used for pagination.
  @BuiltValueField(wireName: r'nextKey')
  String? get nextKey;

  ItemsResponse._();

  factory ItemsResponse([void updates(ItemsResponseBuilder b)]) =
      _$ItemsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ItemsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ItemsResponse> get serializer =>
      _$ItemsResponseSerializer();
}

class _$ItemsResponseSerializer implements PrimitiveSerializer<ItemsResponse> {
  @override
  final Iterable<Type> types = const [ItemsResponse, _$ItemsResponse];

  @override
  final String wireName = r'ItemsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ItemsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(Item)]),
    );
    if (object.nextKey != null) {
      yield r'nextKey';
      yield serializers.serialize(
        object.nextKey,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ItemsResponse object, {
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
    required ItemsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Item)]),
          ) as BuiltList<Item>;
          result.items.replace(valueDes);
          break;
        case r'nextKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nextKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ItemsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ItemsResponseBuilder();
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
