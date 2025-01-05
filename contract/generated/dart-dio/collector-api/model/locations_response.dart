//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:collector/generated/openapi/collector-api/model/location.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'locations_response.g.dart';

/// LocationsResponse
///
/// Properties:
/// * [locations]
/// * [nextKey] - The next key to be used for pagination.
@BuiltValue()
abstract class LocationsResponse
    implements Built<LocationsResponse, LocationsResponseBuilder> {
  @BuiltValueField(wireName: r'locations')
  BuiltList<Location> get locations;

  /// The next key to be used for pagination.
  @BuiltValueField(wireName: r'nextKey')
  String? get nextKey;

  LocationsResponse._();

  factory LocationsResponse([void updates(LocationsResponseBuilder b)]) =
      _$LocationsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LocationsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LocationsResponse> get serializer =>
      _$LocationsResponseSerializer();
}

class _$LocationsResponseSerializer
    implements PrimitiveSerializer<LocationsResponse> {
  @override
  final Iterable<Type> types = const [LocationsResponse, _$LocationsResponse];

  @override
  final String wireName = r'LocationsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LocationsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'locations';
    yield serializers.serialize(
      object.locations,
      specifiedType: const FullType(BuiltList, [FullType(Location)]),
    );
    if (object.nextKey != null) {
      yield r'nextKey';
      yield serializers.serialize(
        object.nextKey,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    LocationsResponse object, {
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
    required LocationsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'locations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Location)]),
          ) as BuiltList<Location>;
          result.locations.replace(valueDes);
          break;
        case r'nextKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nextKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LocationsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LocationsResponseBuilder();
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
