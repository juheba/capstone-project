//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'error_type_enum.g.dart';

class ErrorTypeEnum extends EnumClass {
  /// Information about the type of error.
  @BuiltValueEnumConst(wireName: r'TECHNICAL')
  static const ErrorTypeEnum TECHNICAL = _$TECHNICAL;

  /// Information about the type of error.
  @BuiltValueEnumConst(wireName: r'BUSINESS')
  static const ErrorTypeEnum BUSINESS = _$BUSINESS;

  static Serializer<ErrorTypeEnum> get serializer => _$errorTypeEnumSerializer;

  const ErrorTypeEnum._(String name) : super(name);

  static BuiltSet<ErrorTypeEnum> get values => _$values;
  static ErrorTypeEnum valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ErrorTypeEnumMixin = Object with _$ErrorTypeEnumMixin;
