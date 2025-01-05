// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LocationsResponse extends LocationsResponse {
  @override
  final BuiltList<Location> locations;
  @override
  final String? nextKey;

  factory _$LocationsResponse(
          [void Function(LocationsResponseBuilder)? updates]) =>
      (new LocationsResponseBuilder()..update(updates))._build();

  _$LocationsResponse._({required this.locations, this.nextKey}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        locations, r'LocationsResponse', 'locations');
  }

  @override
  LocationsResponse rebuild(void Function(LocationsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationsResponseBuilder toBuilder() =>
      new LocationsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationsResponse &&
        locations == other.locations &&
        nextKey == other.nextKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locations.hashCode);
    _$hash = $jc(_$hash, nextKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocationsResponse')
          ..add('locations', locations)
          ..add('nextKey', nextKey))
        .toString();
  }
}

class LocationsResponseBuilder
    implements Builder<LocationsResponse, LocationsResponseBuilder> {
  _$LocationsResponse? _$v;

  ListBuilder<Location>? _locations;
  ListBuilder<Location> get locations =>
      _$this._locations ??= new ListBuilder<Location>();
  set locations(ListBuilder<Location>? locations) =>
      _$this._locations = locations;

  String? _nextKey;
  String? get nextKey => _$this._nextKey;
  set nextKey(String? nextKey) => _$this._nextKey = nextKey;

  LocationsResponseBuilder() {
    LocationsResponse._defaults(this);
  }

  LocationsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locations = $v.locations.toBuilder();
      _nextKey = $v.nextKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocationsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LocationsResponse;
  }

  @override
  void update(void Function(LocationsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocationsResponse build() => _build();

  _$LocationsResponse _build() {
    _$LocationsResponse _$result;
    try {
      _$result = _$v ??
          new _$LocationsResponse._(
              locations: locations.build(), nextKey: nextKey);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'locations';
        locations.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LocationsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
