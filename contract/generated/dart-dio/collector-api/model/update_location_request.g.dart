// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_location_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateLocationRequest extends UpdateLocationRequest {
  @override
  final String name;
  @override
  final String? description;

  factory _$UpdateLocationRequest(
          [void Function(UpdateLocationRequestBuilder)? updates]) =>
      (new UpdateLocationRequestBuilder()..update(updates))._build();

  _$UpdateLocationRequest._({required this.name, this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'UpdateLocationRequest', 'name');
  }

  @override
  UpdateLocationRequest rebuild(
          void Function(UpdateLocationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateLocationRequestBuilder toBuilder() =>
      new UpdateLocationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateLocationRequest &&
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
    return (newBuiltValueToStringHelper(r'UpdateLocationRequest')
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class UpdateLocationRequestBuilder
    implements Builder<UpdateLocationRequest, UpdateLocationRequestBuilder> {
  _$UpdateLocationRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  UpdateLocationRequestBuilder() {
    UpdateLocationRequest._defaults(this);
  }

  UpdateLocationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateLocationRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateLocationRequest;
  }

  @override
  void update(void Function(UpdateLocationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateLocationRequest build() => _build();

  _$UpdateLocationRequest _build() {
    final _$result = _$v ??
        new _$UpdateLocationRequest._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UpdateLocationRequest', 'name'),
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
