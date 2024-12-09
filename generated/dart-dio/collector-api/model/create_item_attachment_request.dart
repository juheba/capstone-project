//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_item_attachment_request.g.dart';

/// Creates an item attachment upload URL.
///
/// Properties:
/// * [itemId] - The id of the item.
@BuiltValue()
abstract class CreateItemAttachmentRequest
    implements
        Built<CreateItemAttachmentRequest, CreateItemAttachmentRequestBuilder> {
  /// The id of the item.
  @BuiltValueField(wireName: r'itemId')
  String get itemId;

  CreateItemAttachmentRequest._();

  factory CreateItemAttachmentRequest(
          [void updates(CreateItemAttachmentRequestBuilder b)]) =
      _$CreateItemAttachmentRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateItemAttachmentRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateItemAttachmentRequest> get serializer =>
      _$CreateItemAttachmentRequestSerializer();
}

class _$CreateItemAttachmentRequestSerializer
    implements PrimitiveSerializer<CreateItemAttachmentRequest> {
  @override
  final Iterable<Type> types = const [
    CreateItemAttachmentRequest,
    _$CreateItemAttachmentRequest
  ];

  @override
  final String wireName = r'CreateItemAttachmentRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateItemAttachmentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'itemId';
    yield serializers.serialize(
      object.itemId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateItemAttachmentRequest object, {
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
    required CreateItemAttachmentRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'itemId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.itemId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateItemAttachmentRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateItemAttachmentRequestBuilder();
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
