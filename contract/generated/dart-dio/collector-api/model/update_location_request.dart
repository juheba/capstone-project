//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_location_request.g.dart';

/// Represents the physical locations where collection items.
///
/// Properties:
/// * [name] - The name of the location (e.g., Living Room Bookshelf, Storage Box).
/// * [description] - A description of the location. Provides users with more information about each location.
@BuiltValue()
abstract class UpdateLocationRequest
    implements Built<UpdateLocationRequest, UpdateLocationRequestBuilder> {
  /// The name of the location (e.g., Living Room Bookshelf, Storage Box).
  @BuiltValueField(wireName: r'name')
  String get name;

  /// A description of the location. Provides users with more information about each location.
  @BuiltValueField(wireName: r'description')
  String? get description;

  UpdateLocationRequest._();

  factory UpdateLocationRequest(
      [void updates(UpdateLocationRequestBuilder b)]) = _$UpdateLocationRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateLocationRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateLocationRequest> get serializer =>
      _$UpdateLocationRequestSerializer();
}

class _$UpdateLocationRequestSerializer
    implements PrimitiveSerializer<UpdateLocationRequest> {
  @override
  final Iterable<Type> types = const [
    UpdateLocationRequest,
    _$UpdateLocationRequest
  ];

  @override
  final String wireName = r'UpdateLocationRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateLocationRequest object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateLocationRequest object, {
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
    required UpdateLocationRequestBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateLocationRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateLocationRequestBuilder();
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
