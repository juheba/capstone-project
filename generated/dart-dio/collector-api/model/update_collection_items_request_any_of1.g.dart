// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_items_request_any_of1.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCollectionItemsRequestAnyOf1
    extends UpdateCollectionItemsRequestAnyOf1 {
  @override
  final BuiltList<String> collectionIds;

  factory _$UpdateCollectionItemsRequestAnyOf1(
          [void Function(UpdateCollectionItemsRequestAnyOf1Builder)?
              updates]) =>
      (new UpdateCollectionItemsRequestAnyOf1Builder()..update(updates))
          ._build();

  _$UpdateCollectionItemsRequestAnyOf1._({required this.collectionIds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        collectionIds, r'UpdateCollectionItemsRequestAnyOf1', 'collectionIds');
  }

  @override
  UpdateCollectionItemsRequestAnyOf1 rebuild(
          void Function(UpdateCollectionItemsRequestAnyOf1Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCollectionItemsRequestAnyOf1Builder toBuilder() =>
      new UpdateCollectionItemsRequestAnyOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCollectionItemsRequestAnyOf1 &&
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
    return (newBuiltValueToStringHelper(r'UpdateCollectionItemsRequestAnyOf1')
          ..add('collectionIds', collectionIds))
        .toString();
  }
}

class UpdateCollectionItemsRequestAnyOf1Builder
    implements
        Builder<UpdateCollectionItemsRequestAnyOf1,
            UpdateCollectionItemsRequestAnyOf1Builder> {
  _$UpdateCollectionItemsRequestAnyOf1? _$v;

  ListBuilder<String>? _collectionIds;
  ListBuilder<String> get collectionIds =>
      _$this._collectionIds ??= new ListBuilder<String>();
  set collectionIds(ListBuilder<String>? collectionIds) =>
      _$this._collectionIds = collectionIds;

  UpdateCollectionItemsRequestAnyOf1Builder() {
    UpdateCollectionItemsRequestAnyOf1._defaults(this);
  }

  UpdateCollectionItemsRequestAnyOf1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _collectionIds = $v.collectionIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCollectionItemsRequestAnyOf1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateCollectionItemsRequestAnyOf1;
  }

  @override
  void update(
      void Function(UpdateCollectionItemsRequestAnyOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCollectionItemsRequestAnyOf1 build() => _build();

  _$UpdateCollectionItemsRequestAnyOf1 _build() {
    _$UpdateCollectionItemsRequestAnyOf1 _$result;
    try {
      _$result = _$v ??
          new _$UpdateCollectionItemsRequestAnyOf1._(
              collectionIds: collectionIds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'collectionIds';
        collectionIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateCollectionItemsRequestAnyOf1', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
