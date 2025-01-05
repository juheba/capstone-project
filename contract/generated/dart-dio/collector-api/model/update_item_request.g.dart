// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_item_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateItemRequest extends UpdateItemRequest {
  @override
  final String title;
  @override
  final String? itemType;
  @override
  final String? description;
  @override
  final String? locationId;
  @override
  final bool isLendable;
  @override
  final ItemOwnershipStatusEnum ownershipStatus;
  @override
  final ItemStatusEnum status;

  factory _$UpdateItemRequest(
          [void Function(UpdateItemRequestBuilder)? updates]) =>
      (new UpdateItemRequestBuilder()..update(updates))._build();

  _$UpdateItemRequest._(
      {required this.title,
      this.itemType,
      this.description,
      this.locationId,
      required this.isLendable,
      required this.ownershipStatus,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'UpdateItemRequest', 'title');
    BuiltValueNullFieldError.checkNotNull(
        isLendable, r'UpdateItemRequest', 'isLendable');
    BuiltValueNullFieldError.checkNotNull(
        ownershipStatus, r'UpdateItemRequest', 'ownershipStatus');
    BuiltValueNullFieldError.checkNotNull(
        status, r'UpdateItemRequest', 'status');
  }

  @override
  UpdateItemRequest rebuild(void Function(UpdateItemRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateItemRequestBuilder toBuilder() =>
      new UpdateItemRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateItemRequest &&
        title == other.title &&
        itemType == other.itemType &&
        description == other.description &&
        locationId == other.locationId &&
        isLendable == other.isLendable &&
        ownershipStatus == other.ownershipStatus &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, itemType.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, locationId.hashCode);
    _$hash = $jc(_$hash, isLendable.hashCode);
    _$hash = $jc(_$hash, ownershipStatus.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateItemRequest')
          ..add('title', title)
          ..add('itemType', itemType)
          ..add('description', description)
          ..add('locationId', locationId)
          ..add('isLendable', isLendable)
          ..add('ownershipStatus', ownershipStatus)
          ..add('status', status))
        .toString();
  }
}

class UpdateItemRequestBuilder
    implements Builder<UpdateItemRequest, UpdateItemRequestBuilder> {
  _$UpdateItemRequest? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _itemType;
  String? get itemType => _$this._itemType;
  set itemType(String? itemType) => _$this._itemType = itemType;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _locationId;
  String? get locationId => _$this._locationId;
  set locationId(String? locationId) => _$this._locationId = locationId;

  bool? _isLendable;
  bool? get isLendable => _$this._isLendable;
  set isLendable(bool? isLendable) => _$this._isLendable = isLendable;

  ItemOwnershipStatusEnum? _ownershipStatus;
  ItemOwnershipStatusEnum? get ownershipStatus => _$this._ownershipStatus;
  set ownershipStatus(ItemOwnershipStatusEnum? ownershipStatus) =>
      _$this._ownershipStatus = ownershipStatus;

  ItemStatusEnum? _status;
  ItemStatusEnum? get status => _$this._status;
  set status(ItemStatusEnum? status) => _$this._status = status;

  UpdateItemRequestBuilder() {
    UpdateItemRequest._defaults(this);
  }

  UpdateItemRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _itemType = $v.itemType;
      _description = $v.description;
      _locationId = $v.locationId;
      _isLendable = $v.isLendable;
      _ownershipStatus = $v.ownershipStatus;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateItemRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateItemRequest;
  }

  @override
  void update(void Function(UpdateItemRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateItemRequest build() => _build();

  _$UpdateItemRequest _build() {
    final _$result = _$v ??
        new _$UpdateItemRequest._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'UpdateItemRequest', 'title'),
            itemType: itemType,
            description: description,
            locationId: locationId,
            isLendable: BuiltValueNullFieldError.checkNotNull(
                isLendable, r'UpdateItemRequest', 'isLendable'),
            ownershipStatus: BuiltValueNullFieldError.checkNotNull(
                ownershipStatus, r'UpdateItemRequest', 'ownershipStatus'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'UpdateItemRequest', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
