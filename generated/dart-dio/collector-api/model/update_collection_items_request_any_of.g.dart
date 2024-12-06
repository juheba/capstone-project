// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_items_request_any_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCollectionItemsRequestAnyOf
    extends UpdateCollectionItemsRequestAnyOf {
  @override
  final BuiltList<String> itemIds;

  factory _$UpdateCollectionItemsRequestAnyOf(
          [void Function(UpdateCollectionItemsRequestAnyOfBuilder)? updates]) =>
      (new UpdateCollectionItemsRequestAnyOfBuilder()..update(updates))
          ._build();

  _$UpdateCollectionItemsRequestAnyOf._({required this.itemIds}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        itemIds, r'UpdateCollectionItemsRequestAnyOf', 'itemIds');
  }

  @override
  UpdateCollectionItemsRequestAnyOf rebuild(
          void Function(UpdateCollectionItemsRequestAnyOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCollectionItemsRequestAnyOfBuilder toBuilder() =>
      new UpdateCollectionItemsRequestAnyOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCollectionItemsRequestAnyOf &&
        itemIds == other.itemIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, itemIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateCollectionItemsRequestAnyOf')
          ..add('itemIds', itemIds))
        .toString();
  }
}

class UpdateCollectionItemsRequestAnyOfBuilder
    implements
        Builder<UpdateCollectionItemsRequestAnyOf,
            UpdateCollectionItemsRequestAnyOfBuilder> {
  _$UpdateCollectionItemsRequestAnyOf? _$v;

  ListBuilder<String>? _itemIds;
  ListBuilder<String> get itemIds =>
      _$this._itemIds ??= new ListBuilder<String>();
  set itemIds(ListBuilder<String>? itemIds) => _$this._itemIds = itemIds;

  UpdateCollectionItemsRequestAnyOfBuilder() {
    UpdateCollectionItemsRequestAnyOf._defaults(this);
  }

  UpdateCollectionItemsRequestAnyOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemIds = $v.itemIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCollectionItemsRequestAnyOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateCollectionItemsRequestAnyOf;
  }

  @override
  void update(
      void Function(UpdateCollectionItemsRequestAnyOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCollectionItemsRequestAnyOf build() => _build();

  _$UpdateCollectionItemsRequestAnyOf _build() {
    _$UpdateCollectionItemsRequestAnyOf _$result;
    try {
      _$result = _$v ??
          new _$UpdateCollectionItemsRequestAnyOf._(itemIds: itemIds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'itemIds';
        itemIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateCollectionItemsRequestAnyOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
