// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_location_attachment_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateLocationAttachmentRequest
    extends CreateLocationAttachmentRequest {
  @override
  final String locationId;

  factory _$CreateLocationAttachmentRequest(
          [void Function(CreateLocationAttachmentRequestBuilder)? updates]) =>
      (new CreateLocationAttachmentRequestBuilder()..update(updates))._build();

  _$CreateLocationAttachmentRequest._({required this.locationId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        locationId, r'CreateLocationAttachmentRequest', 'locationId');
  }

  @override
  CreateLocationAttachmentRequest rebuild(
          void Function(CreateLocationAttachmentRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateLocationAttachmentRequestBuilder toBuilder() =>
      new CreateLocationAttachmentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateLocationAttachmentRequest &&
        locationId == other.locationId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locationId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateLocationAttachmentRequest')
          ..add('locationId', locationId))
        .toString();
  }
}

class CreateLocationAttachmentRequestBuilder
    implements
        Builder<CreateLocationAttachmentRequest,
            CreateLocationAttachmentRequestBuilder> {
  _$CreateLocationAttachmentRequest? _$v;

  String? _locationId;
  String? get locationId => _$this._locationId;
  set locationId(String? locationId) => _$this._locationId = locationId;

  CreateLocationAttachmentRequestBuilder() {
    CreateLocationAttachmentRequest._defaults(this);
  }

  CreateLocationAttachmentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locationId = $v.locationId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateLocationAttachmentRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateLocationAttachmentRequest;
  }

  @override
  void update(void Function(CreateLocationAttachmentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateLocationAttachmentRequest build() => _build();

  _$CreateLocationAttachmentRequest _build() {
    final _$result = _$v ??
        new _$CreateLocationAttachmentRequest._(
            locationId: BuiltValueNullFieldError.checkNotNull(
                locationId, r'CreateLocationAttachmentRequest', 'locationId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
