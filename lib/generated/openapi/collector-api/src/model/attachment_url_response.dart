//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'attachment_url_response.g.dart';

/// Creates a attachment upload url.
///
/// Properties:
/// * [uploadUrl] - A upload url to attach a file to an item or location depending on the request parameter.
@BuiltValue()
abstract class AttachmentURLResponse
    implements Built<AttachmentURLResponse, AttachmentURLResponseBuilder> {
  /// A upload url to attach a file to an item or location depending on the request parameter.
  @BuiltValueField(wireName: r'uploadUrl')
  String get uploadUrl;

  AttachmentURLResponse._();

  factory AttachmentURLResponse(
      [void updates(AttachmentURLResponseBuilder b)]) = _$AttachmentURLResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AttachmentURLResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AttachmentURLResponse> get serializer =>
      _$AttachmentURLResponseSerializer();
}

class _$AttachmentURLResponseSerializer
    implements PrimitiveSerializer<AttachmentURLResponse> {
  @override
  final Iterable<Type> types = const [
    AttachmentURLResponse,
    _$AttachmentURLResponse
  ];

  @override
  final String wireName = r'AttachmentURLResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AttachmentURLResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'uploadUrl';
    yield serializers.serialize(
      object.uploadUrl,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AttachmentURLResponse object, {
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
    required AttachmentURLResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'uploadUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.uploadUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AttachmentURLResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AttachmentURLResponseBuilder();
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
