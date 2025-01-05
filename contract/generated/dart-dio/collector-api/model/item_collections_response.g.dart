// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_collections_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ItemCollectionsResponse extends ItemCollectionsResponse {
  @override
  final BuiltList<Collection> collections;

  factory _$ItemCollectionsResponse(
          [void Function(ItemCollectionsResponseBuilder)? updates]) =>
      (new ItemCollectionsResponseBuilder()..update(updates))._build();

  _$ItemCollectionsResponse._({required this.collections}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        collections, r'ItemCollectionsResponse', 'collections');
  }

  @override
  ItemCollectionsResponse rebuild(
          void Function(ItemCollectionsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemCollectionsResponseBuilder toBuilder() =>
      new ItemCollectionsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemCollectionsResponse && collections == other.collections;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, collections.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ItemCollectionsResponse')
          ..add('collections', collections))
        .toString();
  }
}

class ItemCollectionsResponseBuilder
    implements
        Builder<ItemCollectionsResponse, ItemCollectionsResponseBuilder> {
  _$ItemCollectionsResponse? _$v;

  ListBuilder<Collection>? _collections;
  ListBuilder<Collection> get collections =>
      _$this._collections ??= new ListBuilder<Collection>();
  set collections(ListBuilder<Collection>? collections) =>
      _$this._collections = collections;

  ItemCollectionsResponseBuilder() {
    ItemCollectionsResponse._defaults(this);
  }

  ItemCollectionsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _collections = $v.collections.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemCollectionsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemCollectionsResponse;
  }

  @override
  void update(void Function(ItemCollectionsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemCollectionsResponse build() => _build();

  _$ItemCollectionsResponse _build() {
    _$ItemCollectionsResponse _$result;
    try {
      _$result = _$v ??
          new _$ItemCollectionsResponse._(collections: collections.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'collections';
        collections.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ItemCollectionsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
