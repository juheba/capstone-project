// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collection_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateCollectionRequest extends CreateCollectionRequest {
  @override
  final String name;
  @override
  final String? description;
  @override
  final CollectionVisibilityEnum visibility;

  factory _$CreateCollectionRequest(
          [void Function(CreateCollectionRequestBuilder)? updates]) =>
      (new CreateCollectionRequestBuilder()..update(updates))._build();

  _$CreateCollectionRequest._(
      {required this.name, this.description, required this.visibility})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'CreateCollectionRequest', 'name');
    BuiltValueNullFieldError.checkNotNull(
        visibility, r'CreateCollectionRequest', 'visibility');
  }

  @override
  CreateCollectionRequest rebuild(
          void Function(CreateCollectionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateCollectionRequestBuilder toBuilder() =>
      new CreateCollectionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateCollectionRequest &&
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
    return (newBuiltValueToStringHelper(r'CreateCollectionRequest')
          ..add('name', name)
          ..add('description', description)
          ..add('visibility', visibility))
        .toString();
  }
}

class CreateCollectionRequestBuilder
    implements
        Builder<CreateCollectionRequest, CreateCollectionRequestBuilder> {
  _$CreateCollectionRequest? _$v;

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

  CreateCollectionRequestBuilder() {
    CreateCollectionRequest._defaults(this);
  }

  CreateCollectionRequestBuilder get _$this {
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
  void replace(CreateCollectionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateCollectionRequest;
  }

  @override
  void update(void Function(CreateCollectionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateCollectionRequest build() => _build();

  _$CreateCollectionRequest _build() {
    final _$result = _$v ??
        new _$CreateCollectionRequest._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'CreateCollectionRequest', 'name'),
            description: description,
            visibility: BuiltValueNullFieldError.checkNotNull(
                visibility, r'CreateCollectionRequest', 'visibility'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
