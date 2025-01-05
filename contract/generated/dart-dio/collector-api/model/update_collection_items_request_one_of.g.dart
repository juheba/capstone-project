// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_items_request_one_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCollectionItemsRequestOneOf
    extends UpdateCollectionItemsRequestOneOf {
  @override
  final BuiltList<String> itemIds;

  factory _$UpdateCollectionItemsRequestOneOf(
          [void Function(UpdateCollectionItemsRequestOneOfBuilder)? updates]) =>
      (new UpdateCollectionItemsRequestOneOfBuilder()..update(updates))
          ._build();

  _$UpdateCollectionItemsRequestOneOf._({required this.itemIds}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        itemIds, r'UpdateCollectionItemsRequestOneOf', 'itemIds');
  }

  @override
  UpdateCollectionItemsRequestOneOf rebuild(
          void Function(UpdateCollectionItemsRequestOneOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCollectionItemsRequestOneOfBuilder toBuilder() =>
      new UpdateCollectionItemsRequestOneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCollectionItemsRequestOneOf &&
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
    return (newBuiltValueToStringHelper(r'UpdateCollectionItemsRequestOneOf')
          ..add('itemIds', itemIds))
        .toString();
  }
}

class UpdateCollectionItemsRequestOneOfBuilder
    implements
        Builder<UpdateCollectionItemsRequestOneOf,
            UpdateCollectionItemsRequestOneOfBuilder> {
  _$UpdateCollectionItemsRequestOneOf? _$v;

  ListBuilder<String>? _itemIds;
  ListBuilder<String> get itemIds =>
      _$this._itemIds ??= new ListBuilder<String>();
  set itemIds(ListBuilder<String>? itemIds) => _$this._itemIds = itemIds;

  UpdateCollectionItemsRequestOneOfBuilder() {
    UpdateCollectionItemsRequestOneOf._defaults(this);
  }

  UpdateCollectionItemsRequestOneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemIds = $v.itemIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCollectionItemsRequestOneOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateCollectionItemsRequestOneOf;
  }

  @override
  void update(
      void Function(UpdateCollectionItemsRequestOneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCollectionItemsRequestOneOf build() => _build();

  _$UpdateCollectionItemsRequestOneOf _build() {
    _$UpdateCollectionItemsRequestOneOf _$result;
    try {
      _$result = _$v ??
          new _$UpdateCollectionItemsRequestOneOf._(itemIds: itemIds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'itemIds';
        itemIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateCollectionItemsRequestOneOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
