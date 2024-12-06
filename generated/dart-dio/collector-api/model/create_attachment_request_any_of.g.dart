// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_attachment_request_any_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAttachmentRequestAnyOf extends CreateAttachmentRequestAnyOf {
  @override
  final String itemId;

  factory _$CreateAttachmentRequestAnyOf(
          [void Function(CreateAttachmentRequestAnyOfBuilder)? updates]) =>
      (new CreateAttachmentRequestAnyOfBuilder()..update(updates))._build();

  _$CreateAttachmentRequestAnyOf._({required this.itemId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        itemId, r'CreateAttachmentRequestAnyOf', 'itemId');
  }

  @override
  CreateAttachmentRequestAnyOf rebuild(
          void Function(CreateAttachmentRequestAnyOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAttachmentRequestAnyOfBuilder toBuilder() =>
      new CreateAttachmentRequestAnyOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAttachmentRequestAnyOf && itemId == other.itemId;
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
    return (newBuiltValueToStringHelper(r'CreateAttachmentRequestAnyOf')
          ..add('itemId', itemId))
        .toString();
  }
}

class CreateAttachmentRequestAnyOfBuilder
    implements
        Builder<CreateAttachmentRequestAnyOf,
            CreateAttachmentRequestAnyOfBuilder> {
  _$CreateAttachmentRequestAnyOf? _$v;

  String? _itemId;
  String? get itemId => _$this._itemId;
  set itemId(String? itemId) => _$this._itemId = itemId;

  CreateAttachmentRequestAnyOfBuilder() {
    CreateAttachmentRequestAnyOf._defaults(this);
  }

  CreateAttachmentRequestAnyOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemId = $v.itemId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAttachmentRequestAnyOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateAttachmentRequestAnyOf;
  }

  @override
  void update(void Function(CreateAttachmentRequestAnyOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAttachmentRequestAnyOf build() => _build();

  _$CreateAttachmentRequestAnyOf _build() {
    final _$result = _$v ??
        new _$CreateAttachmentRequestAnyOf._(
            itemId: BuiltValueNullFieldError.checkNotNull(
                itemId, r'CreateAttachmentRequestAnyOf', 'itemId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
