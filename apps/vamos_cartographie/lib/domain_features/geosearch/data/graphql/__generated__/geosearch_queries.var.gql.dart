// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GSearchPlacesVars {
  const GSearchPlacesVars({
    required this.q,
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    required this.limit,
    this.radiusKm = const Value.absent(),
    required this.mode,
  });

  factory GSearchPlacesVars.fromJson(Map<String, dynamic> json) {
    return GSearchPlacesVars(
      q: (json['q'] as String),
      lat: json.containsKey('lat')
          ? Value.present(
              json['lat'] == null ? null : (json['lat'] as num).toDouble())
          : Value.absent(),
      lon: json.containsKey('lon')
          ? Value.present(
              json['lon'] == null ? null : (json['lon'] as num).toDouble())
          : Value.absent(),
      limit: (json['limit'] as int),
      radiusKm: json.containsKey('radiusKm')
          ? Value.present(json['radiusKm'] == null
              ? null
              : (json['radiusKm'] as num).toDouble())
          : Value.absent(),
      mode: _i1.GSearchMode.fromJson((json['mode'] as String)),
    );
  }

  final String q;

  final Value<double> lat;

  final Value<double> lon;

  final int limit;

  final Value<double> radiusKm;

  final _i1.GSearchMode mode;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$qValue = this.q;
    _$result['q'] = _$qValue;
    final _$latValue = this.lat;
    if (_$latValue.isPresent) {
      final _$latRequired = _$latValue.requireValue;
      _$result['lat'] = _$latRequired == null ? null : _$latRequired;
    }
    final _$lonValue = this.lon;
    if (_$lonValue.isPresent) {
      final _$lonRequired = _$lonValue.requireValue;
      _$result['lon'] = _$lonRequired == null ? null : _$lonRequired;
    }
    final _$limitValue = this.limit;
    _$result['limit'] = _$limitValue;
    final _$radiusKmValue = this.radiusKm;
    if (_$radiusKmValue.isPresent) {
      final _$radiusKmRequired = _$radiusKmValue.requireValue;
      _$result['radiusKm'] =
          _$radiusKmRequired == null ? null : _$radiusKmRequired;
    }
    final _$modeValue = this.mode;
    _$result['mode'] = _$modeValue.toJson();
    return _$result;
  }

  GSearchPlacesVars copyWith({
    String? q,
    Value<double>? lat,
    Value<double>? lon,
    int? limit,
    Value<double>? radiusKm,
    _i1.GSearchMode? mode,
  }) {
    return GSearchPlacesVars(
      q: q ?? this.q,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      limit: limit ?? this.limit,
      radiusKm: radiusKm ?? this.radiusKm,
      mode: mode ?? this.mode,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchPlacesVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSearchPlacesVars(q: $q, lat: $lat, lon: $lon, limit: $limit, radiusKm: $radiusKm, mode: $mode)';
  }
}
