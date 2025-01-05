//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_ownership_status_enum.g.dart';

class ItemOwnershipStatusEnum extends EnumClass {
  /// Information about whether the user owns the item, wishes to buy it, has borrowed it, etc.
  @BuiltValueEnumConst(wireName: r'OWNER')
  static const ItemOwnershipStatusEnum OWNER = _$OWNER;

  /// Information about whether the user owns the item, wishes to buy it, has borrowed it, etc.
  @BuiltValueEnumConst(wireName: r'BORROWER')
  static const ItemOwnershipStatusEnum BORROWER = _$BORROWER;

  /// Information about whether the user owns the item, wishes to buy it, has borrowed it, etc.
  @BuiltValueEnumConst(wireName: r'WISHLIST')
  static const ItemOwnershipStatusEnum WISHLIST = _$WISHLIST;

  static Serializer<ItemOwnershipStatusEnum> get serializer =>
      _$itemOwnershipStatusEnumSerializer;

  const ItemOwnershipStatusEnum._(String name) : super(name);

  static BuiltSet<ItemOwnershipStatusEnum> get values => _$values;
  static ItemOwnershipStatusEnum valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ItemOwnershipStatusEnumMixin = Object
    with _$ItemOwnershipStatusEnumMixin;
