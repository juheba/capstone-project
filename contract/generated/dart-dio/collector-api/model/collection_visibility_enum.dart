//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'collection_visibility_enum.g.dart';

class CollectionVisibilityEnum extends EnumClass {
  /// Settings to control who can view the collection (public, private, shared with specific users).
  @BuiltValueEnumConst(wireName: r'PRIVATE')
  static const CollectionVisibilityEnum PRIVATE = _$PRIVATE;

  /// Settings to control who can view the collection (public, private, shared with specific users).
  @BuiltValueEnumConst(wireName: r'PUBLIC')
  static const CollectionVisibilityEnum PUBLIC = _$PUBLIC;

  static Serializer<CollectionVisibilityEnum> get serializer =>
      _$collectionVisibilityEnumSerializer;

  const CollectionVisibilityEnum._(String name) : super(name);

  static BuiltSet<CollectionVisibilityEnum> get values => _$values;
  static CollectionVisibilityEnum valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CollectionVisibilityEnumMixin = Object
    with _$CollectionVisibilityEnumMixin;
