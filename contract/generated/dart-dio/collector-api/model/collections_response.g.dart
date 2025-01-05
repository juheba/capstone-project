// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CollectionsResponse extends CollectionsResponse {
  @override
  final BuiltList<Collection> collections;
  @override
  final String? nextKey;

  factory _$CollectionsResponse(
          [void Function(CollectionsResponseBuilder)? updates]) =>
      (new CollectionsResponseBuilder()..update(updates))._build();

  _$CollectionsResponse._({required this.collections, this.nextKey})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        collections, r'CollectionsResponse', 'collections');
  }

  @override
  CollectionsResponse rebuild(
          void Function(CollectionsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionsResponseBuilder toBuilder() =>
      new CollectionsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectionsResponse &&
        collections == other.collections &&
        nextKey == other.nextKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, collections.hashCode);
    _$hash = $jc(_$hash, nextKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CollectionsResponse')
          ..add('collections', collections)
          ..add('nextKey', nextKey))
        .toString();
  }
}

class CollectionsResponseBuilder
    implements Builder<CollectionsResponse, CollectionsResponseBuilder> {
  _$CollectionsResponse? _$v;

  ListBuilder<Collection>? _collections;
  ListBuilder<Collection> get collections =>
      _$this._collections ??= new ListBuilder<Collection>();
  set collections(ListBuilder<Collection>? collections) =>
      _$this._collections = collections;

  String? _nextKey;
  String? get nextKey => _$this._nextKey;
  set nextKey(String? nextKey) => _$this._nextKey = nextKey;

  CollectionsResponseBuilder() {
    CollectionsResponse._defaults(this);
  }

  CollectionsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _collections = $v.collections.toBuilder();
      _nextKey = $v.nextKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectionsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollectionsResponse;
  }

  @override
  void update(void Function(CollectionsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollectionsResponse build() => _build();

  _$CollectionsResponse _build() {
    _$CollectionsResponse _$result;
    try {
      _$result = _$v ??
          new _$CollectionsResponse._(
              collections: collections.build(), nextKey: nextKey);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'collections';
        collections.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CollectionsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
