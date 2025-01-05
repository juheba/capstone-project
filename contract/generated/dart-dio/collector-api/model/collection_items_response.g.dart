// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_items_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CollectionItemsResponse extends CollectionItemsResponse {
  @override
  final BuiltList<Item> items;
  @override
  final String? nextKey;

  factory _$CollectionItemsResponse(
          [void Function(CollectionItemsResponseBuilder)? updates]) =>
      (new CollectionItemsResponseBuilder()..update(updates))._build();

  _$CollectionItemsResponse._({required this.items, this.nextKey}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        items, r'CollectionItemsResponse', 'items');
  }

  @override
  CollectionItemsResponse rebuild(
          void Function(CollectionItemsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionItemsResponseBuilder toBuilder() =>
      new CollectionItemsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectionItemsResponse &&
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
    return (newBuiltValueToStringHelper(r'CollectionItemsResponse')
          ..add('items', items)
          ..add('nextKey', nextKey))
        .toString();
  }
}

class CollectionItemsResponseBuilder
    implements
        Builder<CollectionItemsResponse, CollectionItemsResponseBuilder> {
  _$CollectionItemsResponse? _$v;

  ListBuilder<Item>? _items;
  ListBuilder<Item> get items => _$this._items ??= new ListBuilder<Item>();
  set items(ListBuilder<Item>? items) => _$this._items = items;

  String? _nextKey;
  String? get nextKey => _$this._nextKey;
  set nextKey(String? nextKey) => _$this._nextKey = nextKey;

  CollectionItemsResponseBuilder() {
    CollectionItemsResponse._defaults(this);
  }

  CollectionItemsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextKey = $v.nextKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectionItemsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollectionItemsResponse;
  }

  @override
  void update(void Function(CollectionItemsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollectionItemsResponse build() => _build();

  _$CollectionItemsResponse _build() {
    _$CollectionItemsResponse _$result;
    try {
      _$result = _$v ??
          new _$CollectionItemsResponse._(
              items: items.build(), nextKey: nextKey);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CollectionItemsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
