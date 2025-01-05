// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_item_attachment_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateItemAttachmentRequest extends CreateItemAttachmentRequest {
  @override
  final String itemId;

  factory _$CreateItemAttachmentRequest(
          [void Function(CreateItemAttachmentRequestBuilder)? updates]) =>
      (new CreateItemAttachmentRequestBuilder()..update(updates))._build();

  _$CreateItemAttachmentRequest._({required this.itemId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        itemId, r'CreateItemAttachmentRequest', 'itemId');
  }

  @override
  CreateItemAttachmentRequest rebuild(
          void Function(CreateItemAttachmentRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateItemAttachmentRequestBuilder toBuilder() =>
      new CreateItemAttachmentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateItemAttachmentRequest && itemId == other.itemId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, itemId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateItemAttachmentRequest')
          ..add('itemId', itemId))
        .toString();
  }
}

class CreateItemAttachmentRequestBuilder
    implements
        Builder<CreateItemAttachmentRequest,
            CreateItemAttachmentRequestBuilder> {
  _$CreateItemAttachmentRequest? _$v;

  String? _itemId;
  String? get itemId => _$this._itemId;
  set itemId(String? itemId) => _$this._itemId = itemId;

  CreateItemAttachmentRequestBuilder() {
    CreateItemAttachmentRequest._defaults(this);
  }

  CreateItemAttachmentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemId = $v.itemId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateItemAttachmentRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateItemAttachmentRequest;
  }

  @override
  void update(void Function(CreateItemAttachmentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateItemAttachmentRequest build() => _build();

  _$CreateItemAttachmentRequest _build() {
    final _$result = _$v ??
        new _$CreateItemAttachmentRequest._(
            itemId: BuiltValueNullFieldError.checkNotNull(
                itemId, r'CreateItemAttachmentRequest', 'itemId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
