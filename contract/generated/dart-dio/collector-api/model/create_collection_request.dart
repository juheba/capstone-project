//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:collector/generated/openapi/collector-api/model/collection_visibility_enum.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_collection_request.g.dart';

/// Stores information about the items in each user's collection.
///
/// Properties:
/// * [name] - The name of the collection (e.g., \"Science Fiction Books\", \"Marvel Movies\").
/// * [description] - A brief description of the collection.
/// * [visibility]
@BuiltValue()
abstract class CreateCollectionRequest
    implements Built<CreateCollectionRequest, CreateCollectionRequestBuilder> {
  /// The name of the collection (e.g., \"Science Fiction Books\", \"Marvel Movies\").
  @BuiltValueField(wireName: r'name')
  String get name;

  /// A brief description of the collection.
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'visibility')
  CollectionVisibilityEnum get visibility;
  // enum visibilityEnum {  PRIVATE,  PUBLIC,  };

  CreateCollectionRequest._();

  factory CreateCollectionRequest(
          [void updates(CreateCollectionRequestBuilder b)]) =
      _$CreateCollectionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateCollectionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateCollectionRequest> get serializer =>
      _$CreateCollectionRequestSerializer();
}

class _$CreateCollectionRequestSerializer
    implements PrimitiveSerializer<CreateCollectionRequest> {
  @override
  final Iterable<Type> types = const [
    CreateCollectionRequest,
    _$CreateCollectionRequest
  ];

  @override
  final String wireName = r'CreateCollectionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateCollectionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    CreateCollectionRequest object, {
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
    required CreateCollectionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  CreateCollectionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateCollectionRequestBuilder();
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
