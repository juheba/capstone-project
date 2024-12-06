// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_url_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AttachmentURLResponse extends AttachmentURLResponse {
  @override
  final String uploadUrl;

  factory _$AttachmentURLResponse(
          [void Function(AttachmentURLResponseBuilder)? updates]) =>
      (new AttachmentURLResponseBuilder()..update(updates))._build();

  _$AttachmentURLResponse._({required this.uploadUrl}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        uploadUrl, r'AttachmentURLResponse', 'uploadUrl');
  }

  @override
  AttachmentURLResponse rebuild(
          void Function(AttachmentURLResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttachmentURLResponseBuilder toBuilder() =>
      new AttachmentURLResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AttachmentURLResponse && uploadUrl == other.uploadUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, uploadUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AttachmentURLResponse')
          ..add('uploadUrl', uploadUrl))
        .toString();
  }
}

class AttachmentURLResponseBuilder
    implements Builder<AttachmentURLResponse, AttachmentURLResponseBuilder> {
  _$AttachmentURLResponse? _$v;

  String? _uploadUrl;
  String? get uploadUrl => _$this._uploadUrl;
  set uploadUrl(String? uploadUrl) => _$this._uploadUrl = uploadUrl;

  AttachmentURLResponseBuilder() {
    AttachmentURLResponse._defaults(this);
  }

  AttachmentURLResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uploadUrl = $v.uploadUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AttachmentURLResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AttachmentURLResponse;
  }

  @override
  void update(void Function(AttachmentURLResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AttachmentURLResponse build() => _build();

  _$AttachmentURLResponse _build() {
    final _$result = _$v ??
        new _$AttachmentURLResponse._(
            uploadUrl: BuiltValueNullFieldError.checkNotNull(
                uploadUrl, r'AttachmentURLResponse', 'uploadUrl'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
