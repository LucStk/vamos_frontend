// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/trip/data/graphql/__generated__/trip_fields.data.gql.dart'
    as _i1;

class GGetAllTripBundlesData {
  const GGetAllTripBundlesData({
    required this.trips,
    this.G__typename = 'Query',
  });

  factory GGetAllTripBundlesData.fromJson(Map<String, dynamic> json) {
    return GGetAllTripBundlesData(
      trips: (json['trips'] as List<dynamic>)
          .map((_$e) =>
              _i1.GTripFullData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GTripFullData> trips;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trips'] = this.trips.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetAllTripBundlesData copyWith({
    List<_i1.GTripFullData>? trips,
    String? G__typename,
  }) {
    return GGetAllTripBundlesData(
      trips: trips ?? this.trips,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetAllTripBundlesData &&
            _gqlUtils.listEquals(trips, other.trips) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(trips), G__typename);
  }

  @override
  String toString() {
    return 'GGetAllTripBundlesData(trips: $trips, G__typename: $G__typename)';
  }
}

class GGetTripBundleData {
  const GGetTripBundleData({
    required this.trip,
    this.G__typename = 'Query',
  });

  factory GGetTripBundleData.fromJson(Map<String, dynamic> json) {
    return GGetTripBundleData(
      trip: _i1.GTripFullData.fromJson((json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GTripFullData trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTripBundleData copyWith({
    _i1.GTripFullData? trip,
    String? G__typename,
  }) {
    return GGetTripBundleData(
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripBundleData &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, trip, G__typename);
  }

  @override
  String toString() {
    return 'GGetTripBundleData(trip: $trip, G__typename: $G__typename)';
  }
}

class GGetTripSummaryData {
  const GGetTripSummaryData({
    required this.trip,
    this.G__typename = 'Query',
  });

  factory GGetTripSummaryData.fromJson(Map<String, dynamic> json) {
    return GGetTripSummaryData(
      trip:
          _i1.GTripSummaryData.fromJson((json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GTripSummaryData trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTripSummaryData copyWith({
    _i1.GTripSummaryData? trip,
    String? G__typename,
  }) {
    return GGetTripSummaryData(
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripSummaryData &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, trip, G__typename);
  }

  @override
  String toString() {
    return 'GGetTripSummaryData(trip: $trip, G__typename: $G__typename)';
  }
}

class GGetMeTripsSummaryData {
  const GGetMeTripsSummaryData({
    required this.meTrips,
    this.G__typename = 'Query',
  });

  factory GGetMeTripsSummaryData.fromJson(Map<String, dynamic> json) {
    return GGetMeTripsSummaryData(
      meTrips: (json['meTrips'] as List<dynamic>)
          .map((_$e) =>
              _i1.GTripSummaryData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GTripSummaryData> meTrips;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['meTrips'] = this.meTrips.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetMeTripsSummaryData copyWith({
    List<_i1.GTripSummaryData>? meTrips,
    String? G__typename,
  }) {
    return GGetMeTripsSummaryData(
      meTrips: meTrips ?? this.meTrips,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetMeTripsSummaryData &&
            _gqlUtils.listEquals(meTrips, other.meTrips) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(meTrips), G__typename);
  }

  @override
  String toString() {
    return 'GGetMeTripsSummaryData(meTrips: $meTrips, G__typename: $G__typename)';
  }
}

class GGetUserTripsSummaryData {
  const GGetUserTripsSummaryData({
    required this.userTrips,
    this.G__typename = 'Query',
  });

  factory GGetUserTripsSummaryData.fromJson(Map<String, dynamic> json) {
    return GGetUserTripsSummaryData(
      userTrips: (json['userTrips'] as List<dynamic>)
          .map((_$e) =>
              _i1.GTripSummaryData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GTripSummaryData> userTrips;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['userTrips'] = this.userTrips.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetUserTripsSummaryData copyWith({
    List<_i1.GTripSummaryData>? userTrips,
    String? G__typename,
  }) {
    return GGetUserTripsSummaryData(
      userTrips: userTrips ?? this.userTrips,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetUserTripsSummaryData &&
            _gqlUtils.listEquals(userTrips, other.userTrips) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(userTrips), G__typename);
  }

  @override
  String toString() {
    return 'GGetUserTripsSummaryData(userTrips: $userTrips, G__typename: $G__typename)';
  }
}
