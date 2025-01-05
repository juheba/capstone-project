// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCollectionRequest extends UpdateCollectionRequest {
  @override
  final String name;
  @override
  final String? description;
  @override
  final CollectionVisibilityEnum visibility;

  factory _$UpdateCollectionRequest(
          [void Function(UpdateCollectionRequestBuilder)? updates]) =>
      (new UpdateCollectionRequestBuilder()..update(updates))._build();

  _$UpdateCollectionRequest._(
      {required this.name, this.description, required this.visibility})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'UpdateCollectionRequest', 'name');
    BuiltValueNullFieldError.checkNotNull(
        visibility, r'UpdateCollectionRequest', 'visibility');
  }

  @override
  UpdateCollectionRequest rebuild(
          void Function(UpdateCollectionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCollectionRequestBuilder toBuilder() =>
      new UpdateCollectionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCollectionRequest &&
        name == other.name &&
        description == other.description &&
        visibility == other.visibility;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateCollectionRequest')
          ..add('name', name)
          ..add('description', description)
          ..add('visibility', visibility))
        .toString();
  }
}

class UpdateCollectionRequestBuilder
    implements
        Builder<UpdateCollectionRequest, UpdateCollectionRequestBuilder> {
  _$UpdateCollectionRequest? _$v;

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

  UpdateCollectionRequestBuilder() {
    UpdateCollectionRequest._defaults(this);
  }

  UpdateCollectionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _visibility = $v.visibility;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCollectionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateCollectionRequest;
  }

  @override
  void update(void Function(UpdateCollectionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCollectionRequest build() => _build();

  _$UpdateCollectionRequest _build() {
    final _$result = _$v ??
        new _$UpdateCollectionRequest._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UpdateCollectionRequest', 'name'),
            description: description,
            visibility: BuiltValueNullFieldError.checkNotNull(
                visibility, r'UpdateCollectionRequest', 'visibility'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
