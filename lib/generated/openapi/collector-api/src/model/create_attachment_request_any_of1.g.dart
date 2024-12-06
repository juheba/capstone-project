// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_attachment_request_any_of1.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAttachmentRequestAnyOf1 extends CreateAttachmentRequestAnyOf1 {
  @override
  final String locationId;

  factory _$CreateAttachmentRequestAnyOf1(
          [void Function(CreateAttachmentRequestAnyOf1Builder)? updates]) =>
      (new CreateAttachmentRequestAnyOf1Builder()..update(updates))._build();

  _$CreateAttachmentRequestAnyOf1._({required this.locationId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        locationId, r'CreateAttachmentRequestAnyOf1', 'locationId');
  }

  @override
  CreateAttachmentRequestAnyOf1 rebuild(
          void Function(CreateAttachmentRequestAnyOf1Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAttachmentRequestAnyOf1Builder toBuilder() =>
      new CreateAttachmentRequestAnyOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAttachmentRequestAnyOf1 &&
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
    return (newBuiltValueToStringHelper(r'CreateAttachmentRequestAnyOf1')
          ..add('locationId', locationId))
        .toString();
  }
}

class CreateAttachmentRequestAnyOf1Builder
    implements
        Builder<CreateAttachmentRequestAnyOf1,
            CreateAttachmentRequestAnyOf1Builder> {
  _$CreateAttachmentRequestAnyOf1? _$v;

  String? _locationId;
  String? get locationId => _$this._locationId;
  set locationId(String? locationId) => _$this._locationId = locationId;

  CreateAttachmentRequestAnyOf1Builder() {
    CreateAttachmentRequestAnyOf1._defaults(this);
  }

  CreateAttachmentRequestAnyOf1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locationId = $v.locationId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAttachmentRequestAnyOf1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateAttachmentRequestAnyOf1;
  }

  @override
  void update(void Function(CreateAttachmentRequestAnyOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAttachmentRequestAnyOf1 build() => _build();

  _$CreateAttachmentRequestAnyOf1 _build() {
    final _$result = _$v ??
        new _$CreateAttachmentRequestAnyOf1._(
            locationId: BuiltValueNullFieldError.checkNotNull(
                locationId, r'CreateAttachmentRequestAnyOf1', 'locationId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
