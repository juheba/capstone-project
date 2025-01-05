// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_items_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCollectionItemsRequest extends UpdateCollectionItemsRequest {
  @override
  final OneOf oneOf;

  factory _$UpdateCollectionItemsRequest(
          [void Function(UpdateCollectionItemsRequestBuilder)? updates]) =>
      (new UpdateCollectionItemsRequestBuilder()..update(updates))._build();

  _$UpdateCollectionItemsRequest._({required this.oneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        oneOf, r'UpdateCollectionItemsRequest', 'oneOf');
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
    return other is UpdateCollectionItemsRequest && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateCollectionItemsRequest')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class UpdateCollectionItemsRequestBuilder
    implements
        Builder<UpdateCollectionItemsRequest,
            UpdateCollectionItemsRequestBuilder> {
  _$UpdateCollectionItemsRequest? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  UpdateCollectionItemsRequestBuilder() {
    UpdateCollectionItemsRequest._defaults(this);
  }

  UpdateCollectionItemsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
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
            oneOf: BuiltValueNullFieldError.checkNotNull(
                oneOf, r'UpdateCollectionItemsRequest', 'oneOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
