// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.data.gql.dart'
    as _i1;

abstract class GPlaceResultFields {
  String get id;
  String get name;
  String get subtitle;
  _i1.GLatLng get position;
  String get category;
  int? get distanceM;
  _i1.GBounds? get bounds;
  String get G__typename;
}

class GPlaceResultFieldsData implements GPlaceResultFields {
  const GPlaceResultFieldsData({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.position,
    required this.category,
    this.distanceM,
    this.bounds,
    this.G__typename = 'PlaceResult',
  });

  factory GPlaceResultFieldsData.fromJson(Map<String, dynamic> json) {
    return GPlaceResultFieldsData(
      id: (json['id'] as String),
      name: (json['name'] as String),
      subtitle: (json['subtitle'] as String),
      position:
          _i1.GLatLngData.fromJson((json['position'] as Map<String, dynamic>)),
      category: (json['category'] as String),
      distanceM: json['distanceM'] == null ? null : (json['distanceM'] as int),
      bounds: json['bounds'] == null
          ? null
          : _i1.GBoundsData.fromJson((json['bounds'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String name;

  final String subtitle;

  final _i1.GLatLngData position;

  final String category;

  final int? distanceM;

  final _i1.GBoundsData? bounds;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    _$result['subtitle'] = this.subtitle;
    _$result['position'] = this.position.toJson();
    _$result['category'] = this.category;
    final _$distanceMValue = this.distanceM;
    _$result['distanceM'] = _$distanceMValue == null ? null : _$distanceMValue;
    final _$boundsValue = this.bounds;
    _$result['bounds'] = _$boundsValue == null ? null : _$boundsValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPlaceResultFieldsData copyWith({
    String? id,
    String? name,
    String? subtitle,
    _i1.GLatLngData? position,
    String? category,
    int? distanceM,
    bool distanceMIsSet = false,
    _i1.GBoundsData? bounds,
    bool boundsIsSet = false,
    String? G__typename,
  }) {
    return GPlaceResultFieldsData(
      id: id ?? this.id,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      position: position ?? this.position,
      category: category ?? this.category,
      distanceM:
          distanceM != null || distanceMIsSet ? distanceM : this.distanceM,
      bounds: bounds != null || boundsIsSet ? bounds : this.bounds,
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
            position == other.position &&
            category == other.category &&
            distanceM == other.distanceM &&
            bounds == other.bounds &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, subtitle, position, category,
        distanceM, bounds, G__typename);
  }

  @override
  String toString() {
    return 'GPlaceResultFieldsData(id: $id, name: $name, subtitle: $subtitle, position: $position, category: $category, distanceM: $distanceM, bounds: $bounds, G__typename: $G__typename)';
  }
}
