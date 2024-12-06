//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_attachment_request_any_of.g.dart';

/// CreateAttachmentRequestAnyOf
///
/// Properties:
/// * [itemId] - The id of the item.
@BuiltValue()
abstract class CreateAttachmentRequestAnyOf
    implements
        Built<CreateAttachmentRequestAnyOf,
            CreateAttachmentRequestAnyOfBuilder> {
  /// The id of the item.
  @BuiltValueField(wireName: r'itemId')
  String get itemId;

  CreateAttachmentRequestAnyOf._();

  factory CreateAttachmentRequestAnyOf(
          [void updates(CreateAttachmentRequestAnyOfBuilder b)]) =
      _$CreateAttachmentRequestAnyOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAttachmentRequestAnyOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAttachmentRequestAnyOf> get serializer =>
      _$CreateAttachmentRequestAnyOfSerializer();
}

class _$CreateAttachmentRequestAnyOfSerializer
    implements PrimitiveSerializer<CreateAttachmentRequestAnyOf> {
  @override
  final Iterable<Type> types = const [
    CreateAttachmentRequestAnyOf,
    _$CreateAttachmentRequestAnyOf
  ];

  @override
  final String wireName = r'CreateAttachmentRequestAnyOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAttachmentRequestAnyOf object, {
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
    CreateAttachmentRequestAnyOf object, {
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
    required CreateAttachmentRequestAnyOfBuilder result,
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
  CreateAttachmentRequestAnyOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAttachmentRequestAnyOfBuilder();
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
