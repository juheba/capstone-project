// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_upload_url_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenerateUploadUrlRequest extends GenerateUploadUrlRequest {
  @override
  final OneOf oneOf;

  factory _$GenerateUploadUrlRequest(
          [void Function(GenerateUploadUrlRequestBuilder)? updates]) =>
      (new GenerateUploadUrlRequestBuilder()..update(updates))._build();

  _$GenerateUploadUrlRequest._({required this.oneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        oneOf, r'GenerateUploadUrlRequest', 'oneOf');
  }

  @override
  GenerateUploadUrlRequest rebuild(
          void Function(GenerateUploadUrlRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenerateUploadUrlRequestBuilder toBuilder() =>
      new GenerateUploadUrlRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenerateUploadUrlRequest && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenerateUploadUrlRequest')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class GenerateUploadUrlRequestBuilder
    implements
        Builder<GenerateUploadUrlRequest, GenerateUploadUrlRequestBuilder> {
  _$GenerateUploadUrlRequest? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  GenerateUploadUrlRequestBuilder() {
    GenerateUploadUrlRequest._defaults(this);
  }

  GenerateUploadUrlRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenerateUploadUrlRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenerateUploadUrlRequest;
  }

  @override
  void update(void Function(GenerateUploadUrlRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenerateUploadUrlRequest build() => _build();

  _$GenerateUploadUrlRequest _build() {
    final _$result = _$v ??
        new _$GenerateUploadUrlRequest._(
            oneOf: BuiltValueNullFieldError.checkNotNull(
                oneOf, r'GenerateUploadUrlRequest', 'oneOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
