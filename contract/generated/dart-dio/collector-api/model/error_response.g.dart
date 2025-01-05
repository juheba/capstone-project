// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ErrorResponse extends ErrorResponse {
  @override
  final num statusCode;
  @override
  final String errorCode;
  @override
  final ErrorTypeEnum type;
  @override
  final String message;
  @override
  final String? details;

  factory _$ErrorResponse([void Function(ErrorResponseBuilder)? updates]) =>
      (new ErrorResponseBuilder()..update(updates))._build();

  _$ErrorResponse._(
      {required this.statusCode,
      required this.errorCode,
      required this.type,
      required this.message,
      this.details})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        statusCode, r'ErrorResponse', 'statusCode');
    BuiltValueNullFieldError.checkNotNull(
        errorCode, r'ErrorResponse', 'errorCode');
    BuiltValueNullFieldError.checkNotNull(type, r'ErrorResponse', 'type');
    BuiltValueNullFieldError.checkNotNull(message, r'ErrorResponse', 'message');
  }

  @override
  ErrorResponse rebuild(void Function(ErrorResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorResponseBuilder toBuilder() => new ErrorResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorResponse &&
        statusCode == other.statusCode &&
        errorCode == other.errorCode &&
        type == other.type &&
        message == other.message &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, statusCode.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ErrorResponse')
          ..add('statusCode', statusCode)
          ..add('errorCode', errorCode)
          ..add('type', type)
          ..add('message', message)
          ..add('details', details))
        .toString();
  }
}

class ErrorResponseBuilder
    implements Builder<ErrorResponse, ErrorResponseBuilder> {
  _$ErrorResponse? _$v;

  num? _statusCode;
  num? get statusCode => _$this._statusCode;
  set statusCode(num? statusCode) => _$this._statusCode = statusCode;

  String? _errorCode;
  String? get errorCode => _$this._errorCode;
  set errorCode(String? errorCode) => _$this._errorCode = errorCode;

  ErrorTypeEnum? _type;
  ErrorTypeEnum? get type => _$this._type;
  set type(ErrorTypeEnum? type) => _$this._type = type;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _details;
  String? get details => _$this._details;
  set details(String? details) => _$this._details = details;

  ErrorResponseBuilder() {
    ErrorResponse._defaults(this);
  }

  ErrorResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _statusCode = $v.statusCode;
      _errorCode = $v.errorCode;
      _type = $v.type;
      _message = $v.message;
      _details = $v.details;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ErrorResponse;
  }

  @override
  void update(void Function(ErrorResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ErrorResponse build() => _build();

  _$ErrorResponse _build() {
    final _$result = _$v ??
        new _$ErrorResponse._(
            statusCode: BuiltValueNullFieldError.checkNotNull(
                statusCode, r'ErrorResponse', 'statusCode'),
            errorCode: BuiltValueNullFieldError.checkNotNull(
                errorCode, r'ErrorResponse', 'errorCode'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ErrorResponse', 'type'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ErrorResponse', 'message'),
            details: details);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
