// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Item extends Item {
  @override
  final String itemId;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? itemType;
  @override
  final String userId;
  @override
  final DateTime addedAt;
  @override
  final DateTime lastModified;
  @override
  final String? attachmentUrl;
  @override
  final String? locationId;
  @override
  final bool isLendable;
  @override
  final ItemOwnershipStatusEnum ownershipStatus;
  @override
  final ItemStatusEnum status;

  factory _$Item([void Function(ItemBuilder)? updates]) =>
      (new ItemBuilder()..update(updates))._build();

  _$Item._(
      {required this.itemId,
      required this.title,
      this.description,
      this.itemType,
      required this.userId,
      required this.addedAt,
      required this.lastModified,
      this.attachmentUrl,
      this.locationId,
      required this.isLendable,
      required this.ownershipStatus,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(itemId, r'Item', 'itemId');
    BuiltValueNullFieldError.checkNotNull(title, r'Item', 'title');
    BuiltValueNullFieldError.checkNotNull(userId, r'Item', 'userId');
    BuiltValueNullFieldError.checkNotNull(addedAt, r'Item', 'addedAt');
    BuiltValueNullFieldError.checkNotNull(
        lastModified, r'Item', 'lastModified');
    BuiltValueNullFieldError.checkNotNull(isLendable, r'Item', 'isLendable');
    BuiltValueNullFieldError.checkNotNull(
        ownershipStatus, r'Item', 'ownershipStatus');
    BuiltValueNullFieldError.checkNotNull(status, r'Item', 'status');
  }

  @override
  Item rebuild(void Function(ItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemBuilder toBuilder() => new ItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Item &&
        itemId == other.itemId &&
        title == other.title &&
        description == other.description &&
        itemType == other.itemType &&
        userId == other.userId &&
        addedAt == other.addedAt &&
        lastModified == other.lastModified &&
        attachmentUrl == other.attachmentUrl &&
        locationId == other.locationId &&
        isLendable == other.isLendable &&
        ownershipStatus == other.ownershipStatus &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, itemId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, itemType.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, addedAt.hashCode);
    _$hash = $jc(_$hash, lastModified.hashCode);
    _$hash = $jc(_$hash, attachmentUrl.hashCode);
    _$hash = $jc(_$hash, locationId.hashCode);
    _$hash = $jc(_$hash, isLendable.hashCode);
    _$hash = $jc(_$hash, ownershipStatus.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Item')
          ..add('itemId', itemId)
          ..add('title', title)
          ..add('description', description)
          ..add('itemType', itemType)
          ..add('userId', userId)
          ..add('addedAt', addedAt)
          ..add('lastModified', lastModified)
          ..add('attachmentUrl', attachmentUrl)
          ..add('locationId', locationId)
          ..add('isLendable', isLendable)
          ..add('ownershipStatus', ownershipStatus)
          ..add('status', status))
        .toString();
  }
}

class ItemBuilder implements Builder<Item, ItemBuilder> {
  _$Item? _$v;

  String? _itemId;
  String? get itemId => _$this._itemId;
  set itemId(String? itemId) => _$this._itemId = itemId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _itemType;
  String? get itemType => _$this._itemType;
  set itemType(String? itemType) => _$this._itemType = itemType;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  DateTime? _addedAt;
  DateTime? get addedAt => _$this._addedAt;
  set addedAt(DateTime? addedAt) => _$this._addedAt = addedAt;

  DateTime? _lastModified;
  DateTime? get lastModified => _$this._lastModified;
  set lastModified(DateTime? lastModified) =>
      _$this._lastModified = lastModified;

  String? _attachmentUrl;
  String? get attachmentUrl => _$this._attachmentUrl;
  set attachmentUrl(String? attachmentUrl) =>
      _$this._attachmentUrl = attachmentUrl;

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

  ItemBuilder() {
    Item._defaults(this);
  }

  ItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemId = $v.itemId;
      _title = $v.title;
      _description = $v.description;
      _itemType = $v.itemType;
      _userId = $v.userId;
      _addedAt = $v.addedAt;
      _lastModified = $v.lastModified;
      _attachmentUrl = $v.attachmentUrl;
      _locationId = $v.locationId;
      _isLendable = $v.isLendable;
      _ownershipStatus = $v.ownershipStatus;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Item other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Item;
  }

  @override
  void update(void Function(ItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Item build() => _build();

  _$Item _build() {
    final _$result = _$v ??
        new _$Item._(
            itemId: BuiltValueNullFieldError.checkNotNull(
                itemId, r'Item', 'itemId'),
            title:
                BuiltValueNullFieldError.checkNotNull(title, r'Item', 'title'),
            description: description,
            itemType: itemType,
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'Item', 'userId'),
            addedAt: BuiltValueNullFieldError.checkNotNull(
                addedAt, r'Item', 'addedAt'),
            lastModified: BuiltValueNullFieldError.checkNotNull(
                lastModified, r'Item', 'lastModified'),
            attachmentUrl: attachmentUrl,
            locationId: locationId,
            isLendable: BuiltValueNullFieldError.checkNotNull(
                isLendable, r'Item', 'isLendable'),
            ownershipStatus: BuiltValueNullFieldError.checkNotNull(
                ownershipStatus, r'Item', 'ownershipStatus'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'Item', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
