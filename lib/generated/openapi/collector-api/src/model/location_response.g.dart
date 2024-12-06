// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LocationResponse extends LocationResponse {
  @override
  final Location location;

  factory _$LocationResponse(
          [void Function(LocationResponseBuilder)? updates]) =>
      (new LocationResponseBuilder()..update(updates))._build();

  _$LocationResponse._({required this.location}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        location, r'LocationResponse', 'location');
  }

  @override
  LocationResponse rebuild(void Function(LocationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationResponseBuilder toBuilder() =>
      new LocationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationResponse && location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocationResponse')
          ..add('location', location))
        .toString();
  }
}

class LocationResponseBuilder
    implements Builder<LocationResponse, LocationResponseBuilder> {
  _$LocationResponse? _$v;

  LocationBuilder? _location;
  LocationBuilder get location => _$this._location ??= new LocationBuilder();
  set location(LocationBuilder? location) => _$this._location = location;

  LocationResponseBuilder() {
    LocationResponse._defaults(this);
  }

  LocationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LocationResponse;
  }

  @override
  void update(void Function(LocationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocationResponse build() => _build();

  _$LocationResponse _build() {
    _$LocationResponse _$result;
    try {
      _$result = _$v ?? new _$LocationResponse._(location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LocationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
