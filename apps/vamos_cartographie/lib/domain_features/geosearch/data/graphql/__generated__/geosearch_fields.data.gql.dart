// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GPlaceResultFields {
  String get id;
  String get name;
  String get subtitle;
  double get lat;
  double get lon;
  String get category;
  int? get distanceM;
  List<double>? get bbox;
  String get G__typename;
}

class GPlaceResultFieldsData implements GPlaceResultFields {
  const GPlaceResultFieldsData({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.lat,
    required this.lon,
    required this.category,
    this.distanceM,
    this.bbox,
    this.G__typename = 'PlaceResult',
  });

  factory GPlaceResultFieldsData.fromJson(Map<String, dynamic> json) {
    return GPlaceResultFieldsData(
      id: (json['id'] as String),
      name: (json['name'] as String),
      subtitle: (json['subtitle'] as String),
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      category: (json['category'] as String),
      distanceM: json['distanceM'] == null ? null : (json['distanceM'] as int),
      bbox: json['bbox'] == null
          ? null
          : (json['bbox'] as List<dynamic>)
              .map((_$e) => (_$e as num).toDouble())
              .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String name;

  final String subtitle;

  final double lat;

  final double lon;

  final String category;

  final int? distanceM;

  final List<double>? bbox;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    _$result['subtitle'] = this.subtitle;
    _$result['lat'] = this.lat;
    _$result['lon'] = this.lon;
    _$result['category'] = this.category;
    final _$distanceMValue = this.distanceM;
    _$result['distanceM'] = _$distanceMValue == null ? null : _$distanceMValue;
    final _$bboxValue = this.bbox;
    _$result['bbox'] =
        _$bboxValue == null ? null : _$bboxValue.map((_$e) => _$e).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPlaceResultFieldsData copyWith({
    String? id,
    String? name,
    String? subtitle,
    double? lat,
    double? lon,
    String? category,
    int? distanceM,
    bool distanceMIsSet = false,
    List<double>? bbox,
    bool bboxIsSet = false,
    String? G__typename,
  }) {
    return GPlaceResultFieldsData(
      id: id ?? this.id,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      category: category ?? this.category,
      distanceM:
          distanceM != null || distanceMIsSet ? distanceM : this.distanceM,
      bbox: bbox != null || bboxIsSet ? bbox : this.bbox,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPlaceResultFieldsData &&
            id == other.id &&
            name == other.name &&
            subtitle == other.subtitle &&
            lat == other.lat &&
            lon == other.lon &&
            category == other.category &&
            distanceM == other.distanceM &&
            _gqlUtils.listEquals(bbox, other.bbox) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, subtitle, lat, lon, category,
        distanceM, _gqlUtils.listHash(bbox), G__typename);
  }

  @override
  String toString() {
    return 'GPlaceResultFieldsData(id: $id, name: $name, subtitle: $subtitle, lat: $lat, lon: $lon, category: $category, distanceM: $distanceM, bbox: $bbox, G__typename: $G__typename)';
  }
}
