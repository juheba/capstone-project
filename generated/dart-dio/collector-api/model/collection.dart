//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:collector/generated/openapi/collector-api/model/collection_visibility_enum.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'collection.g.dart';

/// A collection of a user.
///
/// Properties:
/// * [collectionId] - The id of the collection.
/// * [userId] - The id of the user.
/// * [lastModified]
/// * [createdAt]
/// * [name] - The name of the collection (e.g., \"Science Fiction Books\", \"Marvel Movies\").
/// * [description] - A brief description of the collection.
/// * [visibility]
@BuiltValue()
abstract class Collection implements Built<Collection, CollectionBuilder> {
  /// The id of the collection.
  @BuiltValueField(wireName: r'collectionId')
  String get collectionId;

  /// The id of the user.
  @BuiltValueField(wireName: r'userId')
  String get userId;

  @BuiltValueField(wireName: r'lastModified')
  DateTime get lastModified;

  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  /// The name of the collection (e.g., \"Science Fiction Books\", \"Marvel Movies\").
  @BuiltValueField(wireName: r'name')
  String get name;

  /// A brief description of the collection.
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'visibility')
  CollectionVisibilityEnum get visibility;
  // enum visibilityEnum {  PRIVATE,  PUBLIC,  };

  Collection._();

  factory Collection([void updates(CollectionBuilder b)]) = _$Collection;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CollectionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Collection> get serializer => _$CollectionSerializer();
}

class _$CollectionSerializer implements PrimitiveSerializer<Collection> {
  @override
  final Iterable<Type> types = const [Collection, _$Collection];

  @override
  final String wireName = r'Collection';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Collection object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'collectionId';
    yield serializers.serialize(
      object.collectionId,
      specifiedType: const FullType(String),
    );
    yield r'userId';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'lastModified';
    yield serializers.serialize(
      object.lastModified,
      specifiedType: const FullType(DateTime),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    yield r'visibility';
    yield serializers.serialize(
      object.visibility,
      specifiedType: const FullType(CollectionVisibilityEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Collection object, {
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
    required CollectionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'collectionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.collectionId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'lastModified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.lastModified = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'visibility':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CollectionVisibilityEnum),
          ) as CollectionVisibilityEnum;
          result.visibility = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Collection deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollectionBuilder();
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
