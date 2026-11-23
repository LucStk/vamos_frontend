// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GGetTripBundleVars {
  const GGetTripBundleVars({required this.id});

  factory GGetTripBundleVars.fromJson(Map<String, dynamic> json) {
    return GGetTripBundleVars(id: (json['id'] as String));
  }

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GGetTripBundleVars copyWith({String? id}) {
    return GGetTripBundleVars(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripBundleVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetTripBundleVars(id: $id)';
  }
}

class GGetTripSummaryVars {
  const GGetTripSummaryVars({required this.id});

  factory GGetTripSummaryVars.fromJson(Map<String, dynamic> json) {
    return GGetTripSummaryVars(id: (json['id'] as String));
  }

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GGetTripSummaryVars copyWith({String? id}) {
    return GGetTripSummaryVars(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripSummaryVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetTripSummaryVars(id: $id)';
  }
}

class GGetUserTripsSummaryVars {
  const GGetUserTripsSummaryVars({required this.id});

  factory GGetUserTripsSummaryVars.fromJson(Map<String, dynamic> json) {
    return GGetUserTripsSummaryVars(id: (json['id'] as String));
  }

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GGetUserTripsSummaryVars copyWith({String? id}) {
    return GGetUserTripsSummaryVars(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetUserTripsSummaryVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetUserTripsSummaryVars(id: $id)';
  }
}

class GGetUserSavedTripsVars {
  const GGetUserSavedTripsVars({required this.userId});

  factory GGetUserSavedTripsVars.fromJson(Map<String, dynamic> json) {
    return GGetUserSavedTripsVars(userId: (json['userId'] as String));
  }

  final String userId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$userIdValue = this.userId;
    _$result['userId'] = _$userIdValue;
    return _$result;
  }

  GGetUserSavedTripsVars copyWith({String? userId}) {
    return GGetUserSavedTripsVars(userId: userId ?? this.userId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetUserSavedTripsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetUserSavedTripsVars(userId: $userId)';
  }
}

class GDiscoverTripsVars {
  const GDiscoverTripsVars({
    required this.tiles,
    this.filters = const Value.absent(),
    required this.perTile,
  });

  factory GDiscoverTripsVars.fromJson(Map<String, dynamic> json) {
    return GDiscoverTripsVars(
      tiles: (json['tiles'] as List<dynamic>)
          .map((_$e) => _i1.GTileInput.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      filters: json.containsKey('filters')
          ? Value.present(json['filters'] == null
              ? null
              : _i1.GTripDiscoveryFilters.fromJson(
                  (json['filters'] as Map<String, dynamic>)))
          : Value.absent(),
      perTile: (json['perTile'] as int),
    );
  }

  final List<_i1.GTileInput> tiles;

  final Value<_i1.GTripDiscoveryFilters> filters;

  final int perTile;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tilesValue = this.tiles;
    _$result['tiles'] = _$tilesValue.map((_$e) => _$e.toJson()).toList();
    final _$filtersValue = this.filters;
    if (_$filtersValue.isPresent) {
      final _$filtersRequired = _$filtersValue.requireValue;
      _$result['filters'] =
          _$filtersRequired == null ? null : _$filtersRequired.toJson();
    }
    final _$perTileValue = this.perTile;
    _$result['perTile'] = _$perTileValue;
    return _$result;
  }

  GDiscoverTripsVars copyWith({
    List<_i1.GTileInput>? tiles,
    Value<_i1.GTripDiscoveryFilters>? filters,
    int? perTile,
  }) {
    return GDiscoverTripsVars(
      tiles: tiles ?? this.tiles,
      filters: filters ?? this.filters,
      perTile: perTile ?? this.perTile,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDiscoverTripsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDiscoverTripsVars(tiles: $tiles, filters: $filters, perTile: $perTile)';
  }
}
