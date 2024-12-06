//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_attachment_request_any_of1.g.dart';

/// CreateAttachmentRequestAnyOf1
///
/// Properties:
/// * [locationId] - The id of the location.
@BuiltValue()
abstract class CreateAttachmentRequestAnyOf1
    implements
        Built<CreateAttachmentRequestAnyOf1,
            CreateAttachmentRequestAnyOf1Builder> {
  /// The id of the location.
  @BuiltValueField(wireName: r'locationId')
  String get locationId;

  CreateAttachmentRequestAnyOf1._();

  factory CreateAttachmentRequestAnyOf1(
          [void updates(CreateAttachmentRequestAnyOf1Builder b)]) =
      _$CreateAttachmentRequestAnyOf1;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAttachmentRequestAnyOf1Builder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAttachmentRequestAnyOf1> get serializer =>
      _$CreateAttachmentRequestAnyOf1Serializer();
}

class _$CreateAttachmentRequestAnyOf1Serializer
    implements PrimitiveSerializer<CreateAttachmentRequestAnyOf1> {
  @override
  final Iterable<Type> types = const [
    CreateAttachmentRequestAnyOf1,
    _$CreateAttachmentRequestAnyOf1
  ];

  @override
  final String wireName = r'CreateAttachmentRequestAnyOf1';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAttachmentRequestAnyOf1 object, {
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
    CreateAttachmentRequestAnyOf1 object, {
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
    required CreateAttachmentRequestAnyOf1Builder result,
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
  CreateAttachmentRequestAnyOf1 deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAttachmentRequestAnyOf1Builder();
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
