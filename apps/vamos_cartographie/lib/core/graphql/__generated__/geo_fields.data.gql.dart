// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

abstract class GLatLng {
  double get lat;
  double get lng;
  String get G__typename;
}

class GLatLngData implements GLatLng {
  const GLatLngData({
    required this.lat,
    required this.lng,
    this.G__typename = 'LatLngType',
  });

  factory GLatLngData.fromJson(Map<String, dynamic> json) {
    return GLatLngData(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final double lat;

  final double lng;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['lat'] = this.lat;
    _$result['lng'] = this.lng;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GLatLngData copyWith({
    double? lat,
    double? lng,
    String? G__typename,
  }) {
    return GLatLngData(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GLatLngData &&
            lat == other.lat &&
            lng == other.lng &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, lat, lng, G__typename);
  }

  @override
  String toString() {
    return 'GLatLngData(lat: $lat, lng: $lng, G__typename: $G__typename)';
  }
}

abstract class GBounds {
  double get minLng;
  double get minLat;
  double get maxLng;
  double get maxLat;
  String get G__typename;
}

class GBoundsData implements GBounds {
  const GBoundsData({
    required this.minLng,
    required this.minLat,
    required this.maxLng,
    required this.maxLat,
    this.G__typename = 'BoundsType',
  });

  factory GBoundsData.fromJson(Map<String, dynamic> json) {
    return GBoundsData(
      minLng: (json['minLng'] as num).toDouble(),
      minLat: (json['minLat'] as num).toDouble(),
      maxLng: (json['maxLng'] as num).toDouble(),
      maxLat: (json['maxLat'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final double minLng;

  final double minLat;

  final double maxLng;

  final double maxLat;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['minLng'] = this.minLng;
    _$result['minLat'] = this.minLat;
    _$result['maxLng'] = this.maxLng;
    _$result['maxLat'] = this.maxLat;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GBoundsData copyWith({
    double? minLng,
    double? minLat,
    double? maxLng,
    double? maxLat,
    String? G__typename,
  }) {
    return GBoundsData(
      minLng: minLng ?? this.minLng,
      minLat: minLat ?? this.minLat,
      maxLng: maxLng ?? this.maxLng,
      maxLat: maxLat ?? this.maxLat,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GBoundsData &&
            minLng == other.minLng &&
            minLat == other.minLat &&
            maxLng == other.maxLng &&
            maxLat == other.maxLat &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, minLng, minLat, maxLng, maxLat, G__typename);
  }

  @override
  String toString() {
    return 'GBoundsData(minLng: $minLng, minLat: $minLat, maxLng: $maxLng, maxLat: $maxLat, G__typename: $G__typename)';
  }
}
