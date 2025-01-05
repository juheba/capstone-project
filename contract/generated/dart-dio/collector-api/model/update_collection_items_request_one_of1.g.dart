// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_items_request_one_of1.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCollectionItemsRequestOneOf1
    extends UpdateCollectionItemsRequestOneOf1 {
  @override
  final BuiltList<String> collectionIds;

  factory _$UpdateCollectionItemsRequestOneOf1(
          [void Function(UpdateCollectionItemsRequestOneOf1Builder)?
              updates]) =>
      (new UpdateCollectionItemsRequestOneOf1Builder()..update(updates))
          ._build();

  _$UpdateCollectionItemsRequestOneOf1._({required this.collectionIds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        collectionIds, r'UpdateCollectionItemsRequestOneOf1', 'collectionIds');
  }

  @override
  UpdateCollectionItemsRequestOneOf1 rebuild(
          void Function(UpdateCollectionItemsRequestOneOf1Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCollectionItemsRequestOneOf1Builder toBuilder() =>
      new UpdateCollectionItemsRequestOneOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCollectionItemsRequestOneOf1 &&
        collectionIds == other.collectionIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, collectionIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateCollectionItemsRequestOneOf1')
          ..add('collectionIds', collectionIds))
        .toString();
  }
}

class UpdateCollectionItemsRequestOneOf1Builder
    implements
        Builder<UpdateCollectionItemsRequestOneOf1,
            UpdateCollectionItemsRequestOneOf1Builder> {
  _$UpdateCollectionItemsRequestOneOf1? _$v;

  ListBuilder<String>? _collectionIds;
  ListBuilder<String> get collectionIds =>
      _$this._collectionIds ??= new ListBuilder<String>();
  set collectionIds(ListBuilder<String>? collectionIds) =>
      _$this._collectionIds = collectionIds;

  UpdateCollectionItemsRequestOneOf1Builder() {
    UpdateCollectionItemsRequestOneOf1._defaults(this);
  }

  UpdateCollectionItemsRequestOneOf1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _collectionIds = $v.collectionIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCollectionItemsRequestOneOf1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateCollectionItemsRequestOneOf1;
  }

  @override
  void update(
      void Function(UpdateCollectionItemsRequestOneOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCollectionItemsRequestOneOf1 build() => _build();

  _$UpdateCollectionItemsRequestOneOf1 _build() {
    _$UpdateCollectionItemsRequestOneOf1 _$result;
    try {
      _$result = _$v ??
          new _$UpdateCollectionItemsRequestOneOf1._(
              collectionIds: collectionIds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'collectionIds';
        collectionIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateCollectionItemsRequestOneOf1', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
