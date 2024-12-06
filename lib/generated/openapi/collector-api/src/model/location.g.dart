// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Location extends Location {
  @override
  final String name;
  @override
  final String? description;
  @override
  final String userId;
  @override
  final DateTime addedAt;
  @override
  final DateTime lastModified;
  @override
  final String? attachmentUrl;
  @override
  final String locationId;

  factory _$Location([void Function(LocationBuilder)? updates]) =>
      (new LocationBuilder()..update(updates))._build();

  _$Location._(
      {required this.name,
      this.description,
      required this.userId,
      required this.addedAt,
      required this.lastModified,
      this.attachmentUrl,
      required this.locationId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Location', 'name');
    BuiltValueNullFieldError.checkNotNull(userId, r'Location', 'userId');
    BuiltValueNullFieldError.checkNotNull(addedAt, r'Location', 'addedAt');
    BuiltValueNullFieldError.checkNotNull(
        lastModified, r'Location', 'lastModified');
    BuiltValueNullFieldError.checkNotNull(
        locationId, r'Location', 'locationId');
  }

  @override
  Location rebuild(void Function(LocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationBuilder toBuilder() => new LocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Location &&
        name == other.name &&
        description == other.description &&
        userId == other.userId &&
        addedAt == other.addedAt &&
        lastModified == other.lastModified &&
        attachmentUrl == other.attachmentUrl &&
        locationId == other.locationId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, addedAt.hashCode);
    _$hash = $jc(_$hash, lastModified.hashCode);
    _$hash = $jc(_$hash, attachmentUrl.hashCode);
    _$hash = $jc(_$hash, locationId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Location')
          ..add('name', name)
          ..add('description', description)
          ..add('userId', userId)
          ..add('addedAt', addedAt)
          ..add('lastModified', lastModified)
          ..add('attachmentUrl', attachmentUrl)
          ..add('locationId', locationId))
        .toString();
  }
}

class LocationBuilder implements Builder<Location, LocationBuilder> {
  _$Location? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

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

  LocationBuilder() {
    Location._defaults(this);
  }

  LocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _userId = $v.userId;
      _addedAt = $v.addedAt;
      _lastModified = $v.lastModified;
      _attachmentUrl = $v.attachmentUrl;
      _locationId = $v.locationId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Location other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Location;
  }

  @override
  void update(void Function(LocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Location build() => _build();

  _$Location _build() {
    final _$result = _$v ??
        new _$Location._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'Location', 'name'),
            description: description,
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'Location', 'userId'),
            addedAt: BuiltValueNullFieldError.checkNotNull(
                addedAt, r'Location', 'addedAt'),
            lastModified: BuiltValueNullFieldError.checkNotNull(
                lastModified, r'Location', 'lastModified'),
            attachmentUrl: attachmentUrl,
            locationId: BuiltValueNullFieldError.checkNotNull(
                locationId, r'Location', 'locationId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
