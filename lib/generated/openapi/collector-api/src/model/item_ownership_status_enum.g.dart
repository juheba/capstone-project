// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_ownership_status_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ItemOwnershipStatusEnum _$OWNER =
    const ItemOwnershipStatusEnum._('OWNER');
const ItemOwnershipStatusEnum _$BORROWER =
    const ItemOwnershipStatusEnum._('BORROWER');
const ItemOwnershipStatusEnum _$WISHLIST =
    const ItemOwnershipStatusEnum._('WISHLIST');

ItemOwnershipStatusEnum _$valueOf(String name) {
  switch (name) {
    case 'OWNER':
      return _$OWNER;
    case 'BORROWER':
      return _$BORROWER;
    case 'WISHLIST':
      return _$WISHLIST;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ItemOwnershipStatusEnum> _$values =
    new BuiltSet<ItemOwnershipStatusEnum>(const <ItemOwnershipStatusEnum>[
  _$OWNER,
  _$BORROWER,
  _$WISHLIST,
]);

class _$ItemOwnershipStatusEnumMeta {
  const _$ItemOwnershipStatusEnumMeta();
  ItemOwnershipStatusEnum get OWNER => _$OWNER;
  ItemOwnershipStatusEnum get BORROWER => _$BORROWER;
  ItemOwnershipStatusEnum get WISHLIST => _$WISHLIST;
  ItemOwnershipStatusEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<ItemOwnershipStatusEnum> get values => _$values;
}

mixin _$ItemOwnershipStatusEnumMixin {
  // ignore: non_constant_identifier_names
  _$ItemOwnershipStatusEnumMeta get ItemOwnershipStatusEnum =>
      const _$ItemOwnershipStatusEnumMeta();
}

Serializer<ItemOwnershipStatusEnum> _$itemOwnershipStatusEnumSerializer =
    new _$ItemOwnershipStatusEnumSerializer();

class _$ItemOwnershipStatusEnumSerializer
    implements PrimitiveSerializer<ItemOwnershipStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'OWNER': 'OWNER',
    'BORROWER': 'BORROWER',
    'WISHLIST': 'WISHLIST',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'OWNER': 'OWNER',
    'BORROWER': 'BORROWER',
    'WISHLIST': 'WISHLIST',
  };

  @override
  final Iterable<Type> types = const <Type>[ItemOwnershipStatusEnum];
  @override
  final String wireName = 'ItemOwnershipStatusEnum';

  @override
  Object serialize(Serializers serializers, ItemOwnershipStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ItemOwnershipStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ItemOwnershipStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
