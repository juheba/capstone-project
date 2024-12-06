//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:collector/generated/openapi/collector-api/model/create_attachment_request_any_of.dart';
import 'package:collector/generated/openapi/collector-api/model/create_attachment_request_any_of1.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/any_of.dart';

part 'create_attachment_request.g.dart';

/// Creates an attachment upload URL.
///
/// Properties:
/// * [itemId] - Creates an upload URL to attach a file to an item. If itemId is provided, locationId is unnecessary.
/// * [locationId] - Creates an upload URL to attach a file to a location. If locationId is provided, itemId is unnecessary.
@BuiltValue()
abstract class CreateAttachmentRequest
    implements Built<CreateAttachmentRequest, CreateAttachmentRequestBuilder> {
  /// Any Of [CreateAttachmentRequestAnyOf], [CreateAttachmentRequestAnyOf1]
  AnyOf get anyOf;

  CreateAttachmentRequest._();

  factory CreateAttachmentRequest(
          [void updates(CreateAttachmentRequestBuilder b)]) =
      _$CreateAttachmentRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAttachmentRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAttachmentRequest> get serializer =>
      _$CreateAttachmentRequestSerializer();
}

class _$CreateAttachmentRequestSerializer
    implements PrimitiveSerializer<CreateAttachmentRequest> {
  @override
  final Iterable<Type> types = const [
    CreateAttachmentRequest,
    _$CreateAttachmentRequest
  ];

  @override
  final String wireName = r'CreateAttachmentRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAttachmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    CreateAttachmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final anyOf = object.anyOf;
    return serializers.serialize(anyOf,
        specifiedType: FullType(
            AnyOf, anyOf.valueTypes.map((type) => FullType(type)).toList()))!;
  }

  @override
  CreateAttachmentRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAttachmentRequestBuilder();
    Object? anyOfDataSrc;
    final targetType = const FullType(AnyOf, [
      FullType(CreateAttachmentRequestAnyOf),
      FullType(CreateAttachmentRequestAnyOf1),
    ]);
    anyOfDataSrc = serialized;
    result.anyOf = serializers.deserialize(anyOfDataSrc,
        specifiedType: targetType) as AnyOf;
    return result.build();
  }
}
