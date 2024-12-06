//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:collector/generated/openapi/collector-api/model/collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'collection_response.g.dart';

/// CollectionResponse
///
/// Properties:
/// * [collection]
@BuiltValue()
abstract class CollectionResponse
    implements Built<CollectionResponse, CollectionResponseBuilder> {
  @BuiltValueField(wireName: r'collection')
  Collection get collection;

  CollectionResponse._();

  factory CollectionResponse([void updates(CollectionResponseBuilder b)]) =
      _$CollectionResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CollectionResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CollectionResponse> get serializer =>
      _$CollectionResponseSerializer();
}

class _$CollectionResponseSerializer
    implements PrimitiveSerializer<CollectionResponse> {
  @override
  final Iterable<Type> types = const [CollectionResponse, _$CollectionResponse];

  @override
  final String wireName = r'CollectionResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CollectionResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'collection';
    yield serializers.serialize(
      object.collection,
      specifiedType: const FullType(Collection),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CollectionResponse object, {
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
    required CollectionResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'collection':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Collection),
          ) as Collection;
          result.collection.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CollectionResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollectionResponseBuilder();
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
