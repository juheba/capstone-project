// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_status_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ItemStatusEnum _$TODO = const ItemStatusEnum._('TODO');
const ItemStatusEnum _$PROCESSING = const ItemStatusEnum._('PROCESSING');
const ItemStatusEnum _$DONE = const ItemStatusEnum._('DONE');

ItemStatusEnum _$valueOf(String name) {
  switch (name) {
    case 'TODO':
      return _$TODO;
    case 'PROCESSING':
      return _$PROCESSING;
    case 'DONE':
      return _$DONE;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ItemStatusEnum> _$values =
    new BuiltSet<ItemStatusEnum>(const <ItemStatusEnum>[
  _$TODO,
  _$PROCESSING,
  _$DONE,
]);

class _$ItemStatusEnumMeta {
  const _$ItemStatusEnumMeta();
  ItemStatusEnum get TODO => _$TODO;
  ItemStatusEnum get PROCESSING => _$PROCESSING;
  ItemStatusEnum get DONE => _$DONE;
  ItemStatusEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<ItemStatusEnum> get values => _$values;
}

mixin _$ItemStatusEnumMixin {
  // ignore: non_constant_identifier_names
  _$ItemStatusEnumMeta get ItemStatusEnum => const _$ItemStatusEnumMeta();
}

Serializer<ItemStatusEnum> _$itemStatusEnumSerializer =
    new _$ItemStatusEnumSerializer();

class _$ItemStatusEnumSerializer
    implements PrimitiveSerializer<ItemStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'TODO': 'TODO',
    'PROCESSING': 'PROCESSING',
    'DONE': 'DONE',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'TODO': 'TODO',
    'PROCESSING': 'PROCESSING',
    'DONE': 'DONE',
  };

  @override
  final Iterable<Type> types = const <Type>[ItemStatusEnum];
  @override
  final String wireName = 'ItemStatusEnum';

  @override
  Object serialize(Serializers serializers, ItemStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ItemStatusEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ItemStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
