// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_items_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCollectionItemsRequest extends UpdateCollectionItemsRequest {
  @override
  final AnyOf anyOf;

  factory _$UpdateCollectionItemsRequest(
          [void Function(UpdateCollectionItemsRequestBuilder)? updates]) =>
      (new UpdateCollectionItemsRequestBuilder()..update(updates))._build();

  _$UpdateCollectionItemsRequest._({required this.anyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        anyOf, r'UpdateCollectionItemsRequest', 'anyOf');
  }

  @override
  UpdateCollectionItemsRequest rebuild(
          void Function(UpdateCollectionItemsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCollectionItemsRequestBuilder toBuilder() =>
      new UpdateCollectionItemsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCollectionItemsRequest && anyOf == other.anyOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateCollectionItemsRequest')
          ..add('anyOf', anyOf))
        .toString();
  }
}

class UpdateCollectionItemsRequestBuilder
    implements
        Builder<UpdateCollectionItemsRequest,
            UpdateCollectionItemsRequestBuilder> {
  _$UpdateCollectionItemsRequest? _$v;

  AnyOf? _anyOf;
  AnyOf? get anyOf => _$this._anyOf;
  set anyOf(AnyOf? anyOf) => _$this._anyOf = anyOf;

  UpdateCollectionItemsRequestBuilder() {
    UpdateCollectionItemsRequest._defaults(this);
  }

  UpdateCollectionItemsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anyOf = $v.anyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCollectionItemsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateCollectionItemsRequest;
  }

  @override
  void update(void Function(UpdateCollectionItemsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCollectionItemsRequest build() => _build();

  _$UpdateCollectionItemsRequest _build() {
    final _$result = _$v ??
        new _$UpdateCollectionItemsRequest._(
            anyOf: BuiltValueNullFieldError.checkNotNull(
                anyOf, r'UpdateCollectionItemsRequest', 'anyOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
