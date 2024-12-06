// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CollectionResponse extends CollectionResponse {
  @override
  final Collection collection;

  factory _$CollectionResponse(
          [void Function(CollectionResponseBuilder)? updates]) =>
      (new CollectionResponseBuilder()..update(updates))._build();

  _$CollectionResponse._({required this.collection}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        collection, r'CollectionResponse', 'collection');
  }

  @override
  CollectionResponse rebuild(
          void Function(CollectionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionResponseBuilder toBuilder() =>
      new CollectionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectionResponse && collection == other.collection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, collection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CollectionResponse')
          ..add('collection', collection))
        .toString();
  }
}

class CollectionResponseBuilder
    implements Builder<CollectionResponse, CollectionResponseBuilder> {
  _$CollectionResponse? _$v;

  CollectionBuilder? _collection;
  CollectionBuilder get collection =>
      _$this._collection ??= new CollectionBuilder();
  set collection(CollectionBuilder? collection) =>
      _$this._collection = collection;

  CollectionResponseBuilder() {
    CollectionResponse._defaults(this);
  }

  CollectionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _collection = $v.collection.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectionResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollectionResponse;
  }

  @override
  void update(void Function(CollectionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollectionResponse build() => _build();

  _$CollectionResponse _build() {
    _$CollectionResponse _$result;
    try {
      _$result =
          _$v ?? new _$CollectionResponse._(collection: collection.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'collection';
        collection.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CollectionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
