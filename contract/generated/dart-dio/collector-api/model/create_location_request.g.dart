// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_location_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateLocationRequest extends CreateLocationRequest {
  @override
  final String name;
  @override
  final String? description;

  factory _$CreateLocationRequest(
          [void Function(CreateLocationRequestBuilder)? updates]) =>
      (new CreateLocationRequestBuilder()..update(updates))._build();

  _$CreateLocationRequest._({required this.name, this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'CreateLocationRequest', 'name');
  }

  @override
  CreateLocationRequest rebuild(
          void Function(CreateLocationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateLocationRequestBuilder toBuilder() =>
      new CreateLocationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateLocationRequest &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateLocationRequest')
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class CreateLocationRequestBuilder
    implements Builder<CreateLocationRequest, CreateLocationRequestBuilder> {
  _$CreateLocationRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  CreateLocationRequestBuilder() {
    CreateLocationRequest._defaults(this);
  }

  CreateLocationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateLocationRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateLocationRequest;
  }

  @override
  void update(void Function(CreateLocationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateLocationRequest build() => _build();

  _$CreateLocationRequest _build() {
    final _$result = _$v ??
        new _$CreateLocationRequest._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'CreateLocationRequest', 'name'),
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
