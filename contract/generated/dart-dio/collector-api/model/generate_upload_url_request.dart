//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:collector/generated/openapi/collector-api/model/create_location_attachment_request.dart';
import 'package:collector/generated/openapi/collector-api/model/create_item_attachment_request.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'generate_upload_url_request.g.dart';

/// GenerateUploadUrlRequest
///
/// Properties:
/// * [itemId] - The id of the item.
/// * [locationId] - The id of the location.
@BuiltValue()
abstract class GenerateUploadUrlRequest
    implements
        Built<GenerateUploadUrlRequest, GenerateUploadUrlRequestBuilder> {
  /// One Of [CreateItemAttachmentRequest], [CreateLocationAttachmentRequest]
  OneOf get oneOf;

  GenerateUploadUrlRequest._();

  factory GenerateUploadUrlRequest(
          [void updates(GenerateUploadUrlRequestBuilder b)]) =
      _$GenerateUploadUrlRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenerateUploadUrlRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenerateUploadUrlRequest> get serializer =>
      _$GenerateUploadUrlRequestSerializer();
}

class _$GenerateUploadUrlRequestSerializer
    implements PrimitiveSerializer<GenerateUploadUrlRequest> {
  @override
  final Iterable<Type> types = const [
    GenerateUploadUrlRequest,
    _$GenerateUploadUrlRequest
  ];

  @override
  final String wireName = r'GenerateUploadUrlRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenerateUploadUrlRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    GenerateUploadUrlRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  GenerateUploadUrlRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenerateUploadUrlRequestBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [
      FullType(CreateItemAttachmentRequest),
      FullType(CreateLocationAttachmentRequest),
    ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc,
        specifiedType: targetType) as OneOf;
    return result.build();
  }
}
