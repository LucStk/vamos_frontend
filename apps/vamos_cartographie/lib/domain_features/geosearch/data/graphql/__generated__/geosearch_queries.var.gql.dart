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
    this.origin = const Value.absent(),
    required this.limit,
    this.radiusKm = const Value.absent(),
    required this.mode,
  });

  factory GSearchPlacesVars.fromJson(Map<String, dynamic> json) {
    return GSearchPlacesVars(
      q: (json['q'] as String),
      origin: json.containsKey('origin')
          ? Value.present(json['origin'] == null
              ? null
              : _i1.GLatLngInput.fromJson(
                  (json['origin'] as Map<String, dynamic>)))
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

  final Value<_i1.GLatLngInput> origin;

  final int limit;

  final Value<double> radiusKm;

  final _i1.GSearchMode mode;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$qValue = this.q;
    _$result['q'] = _$qValue;
    final _$originValue = this.origin;
    if (_$originValue.isPresent) {
      final _$originRequired = _$originValue.requireValue;
      _$result['origin'] =
          _$originRequired == null ? null : _$originRequired.toJson();
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
    Value<_i1.GLatLngInput>? origin,
    int? limit,
    Value<double>? radiusKm,
    _i1.GSearchMode? mode,
  }) {
    return GSearchPlacesVars(
      q: q ?? this.q,
      origin: origin ?? this.origin,
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
    return 'GSearchPlacesVars(q: $q, origin: $origin, limit: $limit, radiusKm: $radiusKm, mode: $mode)';
  }
}
