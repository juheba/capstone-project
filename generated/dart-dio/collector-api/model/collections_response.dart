//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:collector/generated/openapi/collector-api/model/collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'collections_response.g.dart';

/// CollectionsResponse
///
/// Properties:
/// * [collections]
/// * [nextKey] - The next key to be used for pagination.
@BuiltValue()
abstract class CollectionsResponse
    implements Built<CollectionsResponse, CollectionsResponseBuilder> {
  @BuiltValueField(wireName: r'collections')
  BuiltList<Collection> get collections;

  /// The next key to be used for pagination.
  @BuiltValueField(wireName: r'nextKey')
  String? get nextKey;

  CollectionsResponse._();

  factory CollectionsResponse([void updates(CollectionsResponseBuilder b)]) =
      _$CollectionsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CollectionsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CollectionsResponse> get serializer =>
      _$CollectionsResponseSerializer();
}

class _$CollectionsResponseSerializer
    implements PrimitiveSerializer<CollectionsResponse> {
  @override
  final Iterable<Type> types = const [
    CollectionsResponse,
    _$CollectionsResponse
  ];

  @override
  final String wireName = r'CollectionsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CollectionsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'collections';
    yield serializers.serialize(
      object.collections,
      specifiedType: const FullType(BuiltList, [FullType(Collection)]),
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
    CollectionsResponse object, {
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
    required CollectionsResponseBuilder result,
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
  CollectionsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollectionsResponseBuilder();
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
