// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.data.gql.dart'
    as _i3;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i2;
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

class GGetMeSavedTripsData {
  const GGetMeSavedTripsData({
    required this.meSavedTrips,
    this.G__typename = 'Query',
  });

  factory GGetMeSavedTripsData.fromJson(Map<String, dynamic> json) {
    return GGetMeSavedTripsData(
      meSavedTrips: (json['meSavedTrips'] as List<dynamic>)
          .map((_$e) =>
              _i1.GTripSummaryData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GTripSummaryData> meSavedTrips;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['meSavedTrips'] =
        this.meSavedTrips.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetMeSavedTripsData copyWith({
    List<_i1.GTripSummaryData>? meSavedTrips,
    String? G__typename,
  }) {
    return GGetMeSavedTripsData(
      meSavedTrips: meSavedTrips ?? this.meSavedTrips,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetMeSavedTripsData &&
            _gqlUtils.listEquals(meSavedTrips, other.meSavedTrips) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, _gqlUtils.listHash(meSavedTrips), G__typename);
  }

  @override
  String toString() {
    return 'GGetMeSavedTripsData(meSavedTrips: $meSavedTrips, G__typename: $G__typename)';
  }
}

class GGetUserSavedTripsData {
  const GGetUserSavedTripsData({
    required this.userSavedTrips,
    this.G__typename = 'Query',
  });

  factory GGetUserSavedTripsData.fromJson(Map<String, dynamic> json) {
    return GGetUserSavedTripsData(
      userSavedTrips: (json['userSavedTrips'] as List<dynamic>)
          .map((_$e) =>
              _i1.GTripSummaryData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GTripSummaryData> userSavedTrips;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['userSavedTrips'] =
        this.userSavedTrips.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetUserSavedTripsData copyWith({
    List<_i1.GTripSummaryData>? userSavedTrips,
    String? G__typename,
  }) {
    return GGetUserSavedTripsData(
      userSavedTrips: userSavedTrips ?? this.userSavedTrips,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetUserSavedTripsData &&
            _gqlUtils.listEquals(userSavedTrips, other.userSavedTrips) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, _gqlUtils.listHash(userSavedTrips), G__typename);
  }

  @override
  String toString() {
    return 'GGetUserSavedTripsData(userSavedTrips: $userSavedTrips, G__typename: $G__typename)';
  }
}

class GDiscoverTripsData {
  const GDiscoverTripsData({
    required this.discoverTrips,
    this.G__typename = 'Query',
  });

  factory GDiscoverTripsData.fromJson(Map<String, dynamic> json) {
    return GDiscoverTripsData(
      discoverTrips: (json['discoverTrips'] as List<dynamic>)
          .map((_$e) => GDiscoverTripsData_discoverTrips.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GDiscoverTripsData_discoverTrips> discoverTrips;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['discoverTrips'] =
        this.discoverTrips.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDiscoverTripsData copyWith({
    List<GDiscoverTripsData_discoverTrips>? discoverTrips,
    String? G__typename,
  }) {
    return GDiscoverTripsData(
      discoverTrips: discoverTrips ?? this.discoverTrips,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDiscoverTripsData &&
            _gqlUtils.listEquals(discoverTrips, other.discoverTrips) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, _gqlUtils.listHash(discoverTrips), G__typename);
  }

  @override
  String toString() {
    return 'GDiscoverTripsData(discoverTrips: $discoverTrips, G__typename: $G__typename)';
  }
}

class GDiscoverTripsData_discoverTrips {
  const GDiscoverTripsData_discoverTrips({
    required this.z,
    required this.x,
    required this.y,
    required this.trips,
    this.G__typename = 'DiscoveryTileType',
  });

  factory GDiscoverTripsData_discoverTrips.fromJson(Map<String, dynamic> json) {
    return GDiscoverTripsData_discoverTrips(
      z: (json['z'] as int),
      x: (json['x'] as int),
      y: (json['y'] as int),
      trips: (json['trips'] as List<dynamic>)
          .map((_$e) => GDiscoverTripsData_discoverTrips_trips.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final int z;

  final int x;

  final int y;

  final List<GDiscoverTripsData_discoverTrips_trips> trips;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['z'] = this.z;
    _$result['x'] = this.x;
    _$result['y'] = this.y;
    _$result['trips'] = this.trips.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDiscoverTripsData_discoverTrips copyWith({
    int? z,
    int? x,
    int? y,
    List<GDiscoverTripsData_discoverTrips_trips>? trips,
    String? G__typename,
  }) {
    return GDiscoverTripsData_discoverTrips(
      z: z ?? this.z,
      x: x ?? this.x,
      y: y ?? this.y,
      trips: trips ?? this.trips,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDiscoverTripsData_discoverTrips &&
            z == other.z &&
            x == other.x &&
            y == other.y &&
            _gqlUtils.listEquals(trips, other.trips) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, z, x, y, _gqlUtils.listHash(trips), G__typename);
  }

  @override
  String toString() {
    return 'GDiscoverTripsData_discoverTrips(z: $z, x: $x, y: $y, trips: $trips, G__typename: $G__typename)';
  }
}

class GDiscoverTripsData_discoverTrips_trips {
  const GDiscoverTripsData_discoverTrips_trips({
    required this.score,
    required this.daysCount,
    required this.lengthM,
    this.mainMobility,
    required this.preview,
    required this.trip,
    this.G__typename = 'DiscoveredTripType',
  });

  factory GDiscoverTripsData_discoverTrips_trips.fromJson(
      Map<String, dynamic> json) {
    return GDiscoverTripsData_discoverTrips_trips(
      score: (json['score'] as num).toDouble(),
      daysCount: (json['daysCount'] as int),
      lengthM: (json['lengthM'] as num).toDouble(),
      mainMobility: json['mainMobility'] == null
          ? null
          : _i2.GMobilityType.fromJson((json['mainMobility'] as String)),
      preview: (json['preview'] as List<dynamic>)
          .map((_$e) => (_$e as List<dynamic>)
              .map((_$e) =>
                  _i3.GLatLngData.fromJson((_$e as Map<String, dynamic>)))
              .toList())
          .toList(),
      trip:
          _i1.GTripSummaryData.fromJson((json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final double score;

  final int daysCount;

  final double lengthM;

  final _i2.GMobilityType? mainMobility;

  final List<List<_i3.GLatLngData>> preview;

  final _i1.GTripSummaryData trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['score'] = this.score;
    _$result['daysCount'] = this.daysCount;
    _$result['lengthM'] = this.lengthM;
    final _$mainMobilityValue = this.mainMobility;
    _$result['mainMobility'] =
        _$mainMobilityValue == null ? null : _$mainMobilityValue.toJson();
    _$result['preview'] = this
        .preview
        .map((_$e) => _$e.map((_$e) => _$e.toJson()).toList())
        .toList();
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDiscoverTripsData_discoverTrips_trips copyWith({
    double? score,
    int? daysCount,
    double? lengthM,
    _i2.GMobilityType? mainMobility,
    bool mainMobilityIsSet = false,
    List<List<_i3.GLatLngData>>? preview,
    _i1.GTripSummaryData? trip,
    String? G__typename,
  }) {
    return GDiscoverTripsData_discoverTrips_trips(
      score: score ?? this.score,
      daysCount: daysCount ?? this.daysCount,
      lengthM: lengthM ?? this.lengthM,
      mainMobility: mainMobility != null || mainMobilityIsSet
          ? mainMobility
          : this.mainMobility,
      preview: preview ?? this.preview,
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDiscoverTripsData_discoverTrips_trips &&
            score == other.score &&
            daysCount == other.daysCount &&
            lengthM == other.lengthM &&
            mainMobility == other.mainMobility &&
            _gqlUtils.listEqualsDeep(preview, other.preview) &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, score, daysCount, lengthM, mainMobility,
        _gqlUtils.listHashDeep(preview), trip, G__typename);
  }

  @override
  String toString() {
    return 'GDiscoverTripsData_discoverTrips_trips(score: $score, daysCount: $daysCount, lengthM: $lengthM, mainMobility: $mainMobility, preview: $preview, trip: $trip, G__typename: $G__typename)';
  }
}
