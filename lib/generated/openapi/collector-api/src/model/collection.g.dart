// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Collection extends Collection {
  @override
  final String collectionId;
  @override
  final String userId;
  @override
  final DateTime lastModified;
  @override
  final DateTime createdAt;
  @override
  final String name;
  @override
  final String? description;
  @override
  final CollectionVisibilityEnum visibility;

  factory _$Collection([void Function(CollectionBuilder)? updates]) =>
      (new CollectionBuilder()..update(updates))._build();

  _$Collection._(
      {required this.collectionId,
      required this.userId,
      required this.lastModified,
      required this.createdAt,
      required this.name,
      this.description,
      required this.visibility})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        collectionId, r'Collection', 'collectionId');
    BuiltValueNullFieldError.checkNotNull(userId, r'Collection', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        lastModified, r'Collection', 'lastModified');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'Collection', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(name, r'Collection', 'name');
    BuiltValueNullFieldError.checkNotNull(
        visibility, r'Collection', 'visibility');
  }

  @override
  Collection rebuild(void Function(CollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionBuilder toBuilder() => new CollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Collection &&
        collectionId == other.collectionId &&
        userId == other.userId &&
        lastModified == other.lastModified &&
        createdAt == other.createdAt &&
        name == other.name &&
        description == other.description &&
        visibility == other.visibility;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, collectionId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, lastModified.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Collection')
          ..add('collectionId', collectionId)
          ..add('userId', userId)
          ..add('lastModified', lastModified)
          ..add('createdAt', createdAt)
          ..add('name', name)
          ..add('description', description)
          ..add('visibility', visibility))
        .toString();
  }
}

class CollectionBuilder implements Builder<Collection, CollectionBuilder> {
  _$Collection? _$v;

  String? _collectionId;
  String? get collectionId => _$this._collectionId;
  set collectionId(String? collectionId) => _$this._collectionId = collectionId;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  DateTime? _lastModified;
  DateTime? get lastModified => _$this._lastModified;
  set lastModified(DateTime? lastModified) =>
      _$this._lastModified = lastModified;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  CollectionVisibilityEnum? _visibility;
  CollectionVisibilityEnum? get visibility => _$this._visibility;
  set visibility(CollectionVisibilityEnum? visibility) =>
      _$this._visibility = visibility;

  CollectionBuilder() {
    Collection._defaults(this);
  }

  CollectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _collectionId = $v.collectionId;
      _userId = $v.userId;
      _lastModified = $v.lastModified;
      _createdAt = $v.createdAt;
      _name = $v.name;
      _description = $v.description;
      _visibility = $v.visibility;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Collection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Collection;
  }

  @override
  void update(void Function(CollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Collection build() => _build();

  _$Collection _build() {
    final _$result = _$v ??
        new _$Collection._(
            collectionId: BuiltValueNullFieldError.checkNotNull(
                collectionId, r'Collection', 'collectionId'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'Collection', 'userId'),
            lastModified: BuiltValueNullFieldError.checkNotNull(
                lastModified, r'Collection', 'lastModified'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'Collection', 'createdAt'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'Collection', 'name'),
            description: description,
            visibility: BuiltValueNullFieldError.checkNotNull(
                visibility, r'Collection', 'visibility'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
