//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_location_attachment_request.g.dart';

/// Creates an location attachment upload URL.
///
/// Properties:
/// * [locationId] - The id of the location.
@BuiltValue()
abstract class CreateLocationAttachmentRequest
    implements
        Built<CreateLocationAttachmentRequest,
            CreateLocationAttachmentRequestBuilder> {
  /// The id of the location.
  @BuiltValueField(wireName: r'locationId')
  String get locationId;

  CreateLocationAttachmentRequest._();

  factory CreateLocationAttachmentRequest(
          [void updates(CreateLocationAttachmentRequestBuilder b)]) =
      _$CreateLocationAttachmentRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateLocationAttachmentRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateLocationAttachmentRequest> get serializer =>
      _$CreateLocationAttachmentRequestSerializer();
}

class _$CreateLocationAttachmentRequestSerializer
    implements PrimitiveSerializer<CreateLocationAttachmentRequest> {
  @override
  final Iterable<Type> types = const [
    CreateLocationAttachmentRequest,
    _$CreateLocationAttachmentRequest
  ];

  @override
  final String wireName = r'CreateLocationAttachmentRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateLocationAttachmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'locationId';
    yield serializers.serialize(
      object.locationId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateLocationAttachmentRequest object, {
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
    required CreateLocationAttachmentRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'locationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.locationId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateLocationAttachmentRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateLocationAttachmentRequestBuilder();
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
