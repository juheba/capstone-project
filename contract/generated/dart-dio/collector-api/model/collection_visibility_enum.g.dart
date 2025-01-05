// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_visibility_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CollectionVisibilityEnum _$PRIVATE =
    const CollectionVisibilityEnum._('PRIVATE');
const CollectionVisibilityEnum _$PUBLIC =
    const CollectionVisibilityEnum._('PUBLIC');

CollectionVisibilityEnum _$valueOf(String name) {
  switch (name) {
    case 'PRIVATE':
      return _$PRIVATE;
    case 'PUBLIC':
      return _$PUBLIC;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CollectionVisibilityEnum> _$values =
    new BuiltSet<CollectionVisibilityEnum>(const <CollectionVisibilityEnum>[
  _$PRIVATE,
  _$PUBLIC,
]);

class _$CollectionVisibilityEnumMeta {
  const _$CollectionVisibilityEnumMeta();
  CollectionVisibilityEnum get PRIVATE => _$PRIVATE;
  CollectionVisibilityEnum get PUBLIC => _$PUBLIC;
  CollectionVisibilityEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<CollectionVisibilityEnum> get values => _$values;
}

mixin _$CollectionVisibilityEnumMixin {
  // ignore: non_constant_identifier_names
  _$CollectionVisibilityEnumMeta get CollectionVisibilityEnum =>
      const _$CollectionVisibilityEnumMeta();
}

Serializer<CollectionVisibilityEnum> _$collectionVisibilityEnumSerializer =
    new _$CollectionVisibilityEnumSerializer();

class _$CollectionVisibilityEnumSerializer
    implements PrimitiveSerializer<CollectionVisibilityEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'PRIVATE': 'PRIVATE',
    'PUBLIC': 'PUBLIC',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'PRIVATE': 'PRIVATE',
    'PUBLIC': 'PUBLIC',
  };

  @override
  final Iterable<Type> types = const <Type>[CollectionVisibilityEnum];
  @override
  final String wireName = 'CollectionVisibilityEnum';

  @override
  Object serialize(Serializers serializers, CollectionVisibilityEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CollectionVisibilityEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CollectionVisibilityEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
