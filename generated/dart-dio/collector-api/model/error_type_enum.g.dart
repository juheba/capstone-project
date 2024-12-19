// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_type_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ErrorTypeEnum _$TECHNICAL = const ErrorTypeEnum._('TECHNICAL');
const ErrorTypeEnum _$BUSINESS = const ErrorTypeEnum._('BUSINESS');

ErrorTypeEnum _$valueOf(String name) {
  switch (name) {
    case 'TECHNICAL':
      return _$TECHNICAL;
    case 'BUSINESS':
      return _$BUSINESS;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ErrorTypeEnum> _$values =
    new BuiltSet<ErrorTypeEnum>(const <ErrorTypeEnum>[
  _$TECHNICAL,
  _$BUSINESS,
]);

class _$ErrorTypeEnumMeta {
  const _$ErrorTypeEnumMeta();
  ErrorTypeEnum get TECHNICAL => _$TECHNICAL;
  ErrorTypeEnum get BUSINESS => _$BUSINESS;
  ErrorTypeEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<ErrorTypeEnum> get values => _$values;
}

mixin _$ErrorTypeEnumMixin {
  // ignore: non_constant_identifier_names
  _$ErrorTypeEnumMeta get ErrorTypeEnum => const _$ErrorTypeEnumMeta();
}

Serializer<ErrorTypeEnum> _$errorTypeEnumSerializer =
    new _$ErrorTypeEnumSerializer();

class _$ErrorTypeEnumSerializer implements PrimitiveSerializer<ErrorTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'TECHNICAL': 'TECHNICAL',
    'BUSINESS': 'BUSINESS',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'TECHNICAL': 'TECHNICAL',
    'BUSINESS': 'BUSINESS',
  };

  @override
  final Iterable<Type> types = const <Type>[ErrorTypeEnum];
  @override
  final String wireName = 'ErrorTypeEnum';

  @override
  Object serialize(Serializers serializers, ErrorTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ErrorTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ErrorTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
