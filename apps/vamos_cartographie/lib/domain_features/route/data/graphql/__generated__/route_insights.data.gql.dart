// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GRouteInsightsFields {
  String get computedAt;
  bool get isStale;
  String? get elevationError;
  String? get waysError;
  List<GRouteInsightsFields_mobilities> get mobilities;
  String get G__typename;
}

abstract class GRouteInsightsFields_mobilities {
  _i1.GMobilityType get mobilityType;
  double? get ascentM;
  double? get descentM;
  double? get minElevationM;
  double? get maxElevationM;
  List<GRouteInsightsFields_mobilities_elevationProfile> get elevationProfile;
  double? get totalM;
  double? get analyzedM;
  List<GRouteInsightsFields_mobilities_roadKinds> get roadKinds;
  List<GRouteInsightsFields_mobilities_surfaces> get surfaces;
  List<GRouteInsightsFields_mobilities_cycleInfrastructure>
      get cycleInfrastructure;
  String get G__typename;
}

abstract class GRouteInsightsFields_mobilities_elevationProfile {
  double get distanceM;
  double get elevationM;
  String get G__typename;
}

abstract class GRouteInsightsFields_mobilities_roadKinds {
  String get key;
  double get lengthM;
  String get G__typename;
}

abstract class GRouteInsightsFields_mobilities_surfaces {
  String get key;
  double get lengthM;
  String get G__typename;
}

abstract class GRouteInsightsFields_mobilities_cycleInfrastructure {
  String get key;
  double get lengthM;
  String get G__typename;
}

class GRouteInsightsFieldsData implements GRouteInsightsFields {
  const GRouteInsightsFieldsData({
    required this.computedAt,
    required this.isStale,
    this.elevationError,
    this.waysError,
    required this.mobilities,
    this.G__typename = 'RouteInsightsType',
  });

  factory GRouteInsightsFieldsData.fromJson(Map<String, dynamic> json) {
    return GRouteInsightsFieldsData(
      computedAt: (json['computedAt'] as String),
      isStale: (json['isStale'] as bool),
      elevationError: json['elevationError'] == null
          ? null
          : (json['elevationError'] as String),
      waysError:
          json['waysError'] == null ? null : (json['waysError'] as String),
      mobilities: (json['mobilities'] as List<dynamic>)
          .map((_$e) => GRouteInsightsFieldsData_mobilities.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String computedAt;

  final bool isStale;

  final String? elevationError;

  final String? waysError;

  final List<GRouteInsightsFieldsData_mobilities> mobilities;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['computedAt'] = this.computedAt;
    _$result['isStale'] = this.isStale;
    final _$elevationErrorValue = this.elevationError;
    _$result['elevationError'] =
        _$elevationErrorValue == null ? null : _$elevationErrorValue;
    final _$waysErrorValue = this.waysError;
    _$result['waysError'] = _$waysErrorValue == null ? null : _$waysErrorValue;
    _$result['mobilities'] =
        this.mobilities.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRouteInsightsFieldsData copyWith({
    String? computedAt,
    bool? isStale,
    String? elevationError,
    bool elevationErrorIsSet = false,
    String? waysError,
    bool waysErrorIsSet = false,
    List<GRouteInsightsFieldsData_mobilities>? mobilities,
    String? G__typename,
  }) {
    return GRouteInsightsFieldsData(
      computedAt: computedAt ?? this.computedAt,
      isStale: isStale ?? this.isStale,
      elevationError: elevationError != null || elevationErrorIsSet
          ? elevationError
          : this.elevationError,
      waysError:
          waysError != null || waysErrorIsSet ? waysError : this.waysError,
      mobilities: mobilities ?? this.mobilities,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRouteInsightsFieldsData &&
            computedAt == other.computedAt &&
            isStale == other.isStale &&
            elevationError == other.elevationError &&
            waysError == other.waysError &&
            _gqlUtils.listEquals(mobilities, other.mobilities) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, computedAt, isStale, elevationError,
        waysError, _gqlUtils.listHash(mobilities), G__typename);
  }

  @override
  String toString() {
    return 'GRouteInsightsFieldsData(computedAt: $computedAt, isStale: $isStale, elevationError: $elevationError, waysError: $waysError, mobilities: $mobilities, G__typename: $G__typename)';
  }
}

class GRouteInsightsFieldsData_mobilities
    implements GRouteInsightsFields_mobilities {
  const GRouteInsightsFieldsData_mobilities({
    required this.mobilityType,
    this.ascentM,
    this.descentM,
    this.minElevationM,
    this.maxElevationM,
    required this.elevationProfile,
    this.totalM,
    this.analyzedM,
    required this.roadKinds,
    required this.surfaces,
    required this.cycleInfrastructure,
    this.G__typename = 'MobilityInsightsType',
  });

  factory GRouteInsightsFieldsData_mobilities.fromJson(
      Map<String, dynamic> json) {
    return GRouteInsightsFieldsData_mobilities(
      mobilityType:
          _i1.GMobilityType.fromJson((json['mobilityType'] as String)),
      ascentM:
          json['ascentM'] == null ? null : (json['ascentM'] as num).toDouble(),
      descentM: json['descentM'] == null
          ? null
          : (json['descentM'] as num).toDouble(),
      minElevationM: json['minElevationM'] == null
          ? null
          : (json['minElevationM'] as num).toDouble(),
      maxElevationM: json['maxElevationM'] == null
          ? null
          : (json['maxElevationM'] as num).toDouble(),
      elevationProfile: (json['elevationProfile'] as List<dynamic>)
          .map((_$e) =>
              GRouteInsightsFieldsData_mobilities_elevationProfile.fromJson(
                  (_$e as Map<String, dynamic>)))
          .toList(),
      totalM:
          json['totalM'] == null ? null : (json['totalM'] as num).toDouble(),
      analyzedM: json['analyzedM'] == null
          ? null
          : (json['analyzedM'] as num).toDouble(),
      roadKinds: (json['roadKinds'] as List<dynamic>)
          .map((_$e) => GRouteInsightsFieldsData_mobilities_roadKinds.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      surfaces: (json['surfaces'] as List<dynamic>)
          .map((_$e) => GRouteInsightsFieldsData_mobilities_surfaces.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      cycleInfrastructure: (json['cycleInfrastructure'] as List<dynamic>)
          .map((_$e) =>
              GRouteInsightsFieldsData_mobilities_cycleInfrastructure.fromJson(
                  (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GMobilityType mobilityType;

  final double? ascentM;

  final double? descentM;

  final double? minElevationM;

  final double? maxElevationM;

  final List<GRouteInsightsFieldsData_mobilities_elevationProfile>
      elevationProfile;

  final double? totalM;

  final double? analyzedM;

  final List<GRouteInsightsFieldsData_mobilities_roadKinds> roadKinds;

  final List<GRouteInsightsFieldsData_mobilities_surfaces> surfaces;

  final List<GRouteInsightsFieldsData_mobilities_cycleInfrastructure>
      cycleInfrastructure;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['mobilityType'] = this.mobilityType.toJson();
    final _$ascentMValue = this.ascentM;
    _$result['ascentM'] = _$ascentMValue == null ? null : _$ascentMValue;
    final _$descentMValue = this.descentM;
    _$result['descentM'] = _$descentMValue == null ? null : _$descentMValue;
    final _$minElevationMValue = this.minElevationM;
    _$result['minElevationM'] =
        _$minElevationMValue == null ? null : _$minElevationMValue;
    final _$maxElevationMValue = this.maxElevationM;
    _$result['maxElevationM'] =
        _$maxElevationMValue == null ? null : _$maxElevationMValue;
    _$result['elevationProfile'] =
        this.elevationProfile.map((_$e) => _$e.toJson()).toList();
    final _$totalMValue = this.totalM;
    _$result['totalM'] = _$totalMValue == null ? null : _$totalMValue;
    final _$analyzedMValue = this.analyzedM;
    _$result['analyzedM'] = _$analyzedMValue == null ? null : _$analyzedMValue;
    _$result['roadKinds'] = this.roadKinds.map((_$e) => _$e.toJson()).toList();
    _$result['surfaces'] = this.surfaces.map((_$e) => _$e.toJson()).toList();
    _$result['cycleInfrastructure'] =
        this.cycleInfrastructure.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRouteInsightsFieldsData_mobilities copyWith({
    _i1.GMobilityType? mobilityType,
    double? ascentM,
    bool ascentMIsSet = false,
    double? descentM,
    bool descentMIsSet = false,
    double? minElevationM,
    bool minElevationMIsSet = false,
    double? maxElevationM,
    bool maxElevationMIsSet = false,
    List<GRouteInsightsFieldsData_mobilities_elevationProfile>?
        elevationProfile,
    double? totalM,
    bool totalMIsSet = false,
    double? analyzedM,
    bool analyzedMIsSet = false,
    List<GRouteInsightsFieldsData_mobilities_roadKinds>? roadKinds,
    List<GRouteInsightsFieldsData_mobilities_surfaces>? surfaces,
    List<GRouteInsightsFieldsData_mobilities_cycleInfrastructure>?
        cycleInfrastructure,
    String? G__typename,
  }) {
    return GRouteInsightsFieldsData_mobilities(
      mobilityType: mobilityType ?? this.mobilityType,
      ascentM: ascentM != null || ascentMIsSet ? ascentM : this.ascentM,
      descentM: descentM != null || descentMIsSet ? descentM : this.descentM,
      minElevationM: minElevationM != null || minElevationMIsSet
          ? minElevationM
          : this.minElevationM,
      maxElevationM: maxElevationM != null || maxElevationMIsSet
          ? maxElevationM
          : this.maxElevationM,
      elevationProfile: elevationProfile ?? this.elevationProfile,
      totalM: totalM != null || totalMIsSet ? totalM : this.totalM,
      analyzedM:
          analyzedM != null || analyzedMIsSet ? analyzedM : this.analyzedM,
      roadKinds: roadKinds ?? this.roadKinds,
      surfaces: surfaces ?? this.surfaces,
      cycleInfrastructure: cycleInfrastructure ?? this.cycleInfrastructure,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRouteInsightsFieldsData_mobilities &&
            mobilityType == other.mobilityType &&
            ascentM == other.ascentM &&
            descentM == other.descentM &&
            minElevationM == other.minElevationM &&
            maxElevationM == other.maxElevationM &&
            _gqlUtils.listEquals(elevationProfile, other.elevationProfile) &&
            totalM == other.totalM &&
            analyzedM == other.analyzedM &&
            _gqlUtils.listEquals(roadKinds, other.roadKinds) &&
            _gqlUtils.listEquals(surfaces, other.surfaces) &&
            _gqlUtils.listEquals(
                cycleInfrastructure, other.cycleInfrastructure) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        mobilityType,
        ascentM,
        descentM,
        minElevationM,
        maxElevationM,
        _gqlUtils.listHash(elevationProfile),
        totalM,
        analyzedM,
        _gqlUtils.listHash(roadKinds),
        _gqlUtils.listHash(surfaces),
        _gqlUtils.listHash(cycleInfrastructure),
        G__typename);
  }

  @override
  String toString() {
    return 'GRouteInsightsFieldsData_mobilities(mobilityType: $mobilityType, ascentM: $ascentM, descentM: $descentM, minElevationM: $minElevationM, maxElevationM: $maxElevationM, elevationProfile: $elevationProfile, totalM: $totalM, analyzedM: $analyzedM, roadKinds: $roadKinds, surfaces: $surfaces, cycleInfrastructure: $cycleInfrastructure, G__typename: $G__typename)';
  }
}

class GRouteInsightsFieldsData_mobilities_elevationProfile
    implements GRouteInsightsFields_mobilities_elevationProfile {
  const GRouteInsightsFieldsData_mobilities_elevationProfile({
    required this.distanceM,
    required this.elevationM,
    this.G__typename = 'ElevationPointType',
  });

  factory GRouteInsightsFieldsData_mobilities_elevationProfile.fromJson(
      Map<String, dynamic> json) {
    return GRouteInsightsFieldsData_mobilities_elevationProfile(
      distanceM: (json['distanceM'] as num).toDouble(),
      elevationM: (json['elevationM'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final double distanceM;

  final double elevationM;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['distanceM'] = this.distanceM;
    _$result['elevationM'] = this.elevationM;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRouteInsightsFieldsData_mobilities_elevationProfile copyWith({
    double? distanceM,
    double? elevationM,
    String? G__typename,
  }) {
    return GRouteInsightsFieldsData_mobilities_elevationProfile(
      distanceM: distanceM ?? this.distanceM,
      elevationM: elevationM ?? this.elevationM,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRouteInsightsFieldsData_mobilities_elevationProfile &&
            distanceM == other.distanceM &&
            elevationM == other.elevationM &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, distanceM, elevationM, G__typename);
  }

  @override
  String toString() {
    return 'GRouteInsightsFieldsData_mobilities_elevationProfile(distanceM: $distanceM, elevationM: $elevationM, G__typename: $G__typename)';
  }
}

class GRouteInsightsFieldsData_mobilities_roadKinds
    implements GRouteInsightsFields_mobilities_roadKinds {
  const GRouteInsightsFieldsData_mobilities_roadKinds({
    required this.key,
    required this.lengthM,
    this.G__typename = 'WayShareType',
  });

  factory GRouteInsightsFieldsData_mobilities_roadKinds.fromJson(
      Map<String, dynamic> json) {
    return GRouteInsightsFieldsData_mobilities_roadKinds(
      key: (json['key'] as String),
      lengthM: (json['lengthM'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String key;

  final double lengthM;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['key'] = this.key;
    _$result['lengthM'] = this.lengthM;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRouteInsightsFieldsData_mobilities_roadKinds copyWith({
    String? key,
    double? lengthM,
    String? G__typename,
  }) {
    return GRouteInsightsFieldsData_mobilities_roadKinds(
      key: key ?? this.key,
      lengthM: lengthM ?? this.lengthM,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRouteInsightsFieldsData_mobilities_roadKinds &&
            key == other.key &&
            lengthM == other.lengthM &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, key, lengthM, G__typename);
  }

  @override
  String toString() {
    return 'GRouteInsightsFieldsData_mobilities_roadKinds(key: $key, lengthM: $lengthM, G__typename: $G__typename)';
  }
}

class GRouteInsightsFieldsData_mobilities_surfaces
    implements GRouteInsightsFields_mobilities_surfaces {
  const GRouteInsightsFieldsData_mobilities_surfaces({
    required this.key,
    required this.lengthM,
    this.G__typename = 'WayShareType',
  });

  factory GRouteInsightsFieldsData_mobilities_surfaces.fromJson(
      Map<String, dynamic> json) {
    return GRouteInsightsFieldsData_mobilities_surfaces(
      key: (json['key'] as String),
      lengthM: (json['lengthM'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String key;

  final double lengthM;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['key'] = this.key;
    _$result['lengthM'] = this.lengthM;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRouteInsightsFieldsData_mobilities_surfaces copyWith({
    String? key,
    double? lengthM,
    String? G__typename,
  }) {
    return GRouteInsightsFieldsData_mobilities_surfaces(
      key: key ?? this.key,
      lengthM: lengthM ?? this.lengthM,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRouteInsightsFieldsData_mobilities_surfaces &&
            key == other.key &&
            lengthM == other.lengthM &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, key, lengthM, G__typename);
  }

  @override
  String toString() {
    return 'GRouteInsightsFieldsData_mobilities_surfaces(key: $key, lengthM: $lengthM, G__typename: $G__typename)';
  }
}

class GRouteInsightsFieldsData_mobilities_cycleInfrastructure
    implements GRouteInsightsFields_mobilities_cycleInfrastructure {
  const GRouteInsightsFieldsData_mobilities_cycleInfrastructure({
    required this.key,
    required this.lengthM,
    this.G__typename = 'WayShareType',
  });

  factory GRouteInsightsFieldsData_mobilities_cycleInfrastructure.fromJson(
      Map<String, dynamic> json) {
    return GRouteInsightsFieldsData_mobilities_cycleInfrastructure(
      key: (json['key'] as String),
      lengthM: (json['lengthM'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String key;

  final double lengthM;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['key'] = this.key;
    _$result['lengthM'] = this.lengthM;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRouteInsightsFieldsData_mobilities_cycleInfrastructure copyWith({
    String? key,
    double? lengthM,
    String? G__typename,
  }) {
    return GRouteInsightsFieldsData_mobilities_cycleInfrastructure(
      key: key ?? this.key,
      lengthM: lengthM ?? this.lengthM,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRouteInsightsFieldsData_mobilities_cycleInfrastructure &&
            key == other.key &&
            lengthM == other.lengthM &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, key, lengthM, G__typename);
  }

  @override
  String toString() {
    return 'GRouteInsightsFieldsData_mobilities_cycleInfrastructure(key: $key, lengthM: $lengthM, G__typename: $G__typename)';
  }
}

class GFetchRouteInsightsData {
  const GFetchRouteInsightsData({
    this.routeInsights,
    this.G__typename = 'Query',
  });

  factory GFetchRouteInsightsData.fromJson(Map<String, dynamic> json) {
    return GFetchRouteInsightsData(
      routeInsights: json['routeInsights'] == null
          ? null
          : GRouteInsightsFieldsData.fromJson(
              (json['routeInsights'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GRouteInsightsFieldsData? routeInsights;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$routeInsightsValue = this.routeInsights;
    _$result['routeInsights'] =
        _$routeInsightsValue == null ? null : _$routeInsightsValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GFetchRouteInsightsData copyWith({
    GRouteInsightsFieldsData? routeInsights,
    bool routeInsightsIsSet = false,
    String? G__typename,
  }) {
    return GFetchRouteInsightsData(
      routeInsights: routeInsights != null || routeInsightsIsSet
          ? routeInsights
          : this.routeInsights,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFetchRouteInsightsData &&
            routeInsights == other.routeInsights &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, routeInsights, G__typename);
  }

  @override
  String toString() {
    return 'GFetchRouteInsightsData(routeInsights: $routeInsights, G__typename: $G__typename)';
  }
}

class GRecomputeRouteInsightsData {
  const GRecomputeRouteInsightsData({
    this.recomputeRouteInsights,
    this.G__typename = 'Mutation',
  });

  factory GRecomputeRouteInsightsData.fromJson(Map<String, dynamic> json) {
    return GRecomputeRouteInsightsData(
      recomputeRouteInsights: json['recomputeRouteInsights'] == null
          ? null
          : GRouteInsightsFieldsData.fromJson(
              (json['recomputeRouteInsights'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GRouteInsightsFieldsData? recomputeRouteInsights;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$recomputeRouteInsightsValue = this.recomputeRouteInsights;
    _$result['recomputeRouteInsights'] = _$recomputeRouteInsightsValue == null
        ? null
        : _$recomputeRouteInsightsValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRecomputeRouteInsightsData copyWith({
    GRouteInsightsFieldsData? recomputeRouteInsights,
    bool recomputeRouteInsightsIsSet = false,
    String? G__typename,
  }) {
    return GRecomputeRouteInsightsData(
      recomputeRouteInsights:
          recomputeRouteInsights != null || recomputeRouteInsightsIsSet
              ? recomputeRouteInsights
              : this.recomputeRouteInsights,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRecomputeRouteInsightsData &&
            recomputeRouteInsights == other.recomputeRouteInsights &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, recomputeRouteInsights, G__typename);
  }

  @override
  String toString() {
    return 'GRecomputeRouteInsightsData(recomputeRouteInsights: $recomputeRouteInsights, G__typename: $G__typename)';
  }
}
