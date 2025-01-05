//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_status_enum.g.dart';

class ItemStatusEnum extends EnumClass {
  /// Information about whether the item has been read/watched, is currently being read/watched, or is on a to-read/to-watch list.
  @BuiltValueEnumConst(wireName: r'TODO')
  static const ItemStatusEnum TODO = _$TODO;

  /// Information about whether the item has been read/watched, is currently being read/watched, or is on a to-read/to-watch list.
  @BuiltValueEnumConst(wireName: r'PROCESSING')
  static const ItemStatusEnum PROCESSING = _$PROCESSING;

  /// Information about whether the item has been read/watched, is currently being read/watched, or is on a to-read/to-watch list.
  @BuiltValueEnumConst(wireName: r'DONE')
  static const ItemStatusEnum DONE = _$DONE;

  static Serializer<ItemStatusEnum> get serializer =>
      _$itemStatusEnumSerializer;

  const ItemStatusEnum._(String name) : super(name);

  static BuiltSet<ItemStatusEnum> get values => _$values;
  static ItemStatusEnum valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ItemStatusEnumMixin = Object with _$ItemStatusEnumMixin;
