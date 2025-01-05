// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ItemsResponse extends ItemsResponse {
  @override
  final BuiltList<Item> items;
  @override
  final String? nextKey;

  factory _$ItemsResponse([void Function(ItemsResponseBuilder)? updates]) =>
      (new ItemsResponseBuilder()..update(updates))._build();

  _$ItemsResponse._({required this.items, this.nextKey}) : super._() {
    BuiltValueNullFieldError.checkNotNull(items, r'ItemsResponse', 'items');
  }

  @override
  ItemsResponse rebuild(void Function(ItemsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemsResponseBuilder toBuilder() => new ItemsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemsResponse &&
        items == other.items &&
        nextKey == other.nextKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, nextKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ItemsResponse')
          ..add('items', items)
          ..add('nextKey', nextKey))
        .toString();
  }
}

class ItemsResponseBuilder
    implements Builder<ItemsResponse, ItemsResponseBuilder> {
  _$ItemsResponse? _$v;

  ListBuilder<Item>? _items;
  ListBuilder<Item> get items => _$this._items ??= new ListBuilder<Item>();
  set items(ListBuilder<Item>? items) => _$this._items = items;

  String? _nextKey;
  String? get nextKey => _$this._nextKey;
  set nextKey(String? nextKey) => _$this._nextKey = nextKey;

  ItemsResponseBuilder() {
    ItemsResponse._defaults(this);
  }

  ItemsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextKey = $v.nextKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemsResponse;
  }

  @override
  void update(void Function(ItemsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemsResponse build() => _build();

  _$ItemsResponse _build() {
    _$ItemsResponse _$result;
    try {
      _$result =
          _$v ?? new _$ItemsResponse._(items: items.build(), nextKey: nextKey);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ItemsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
