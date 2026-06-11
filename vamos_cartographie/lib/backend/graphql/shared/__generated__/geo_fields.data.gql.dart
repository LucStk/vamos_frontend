// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

abstract class GLatLngFields {
  double get lat;
  double get lng;
  String get G__typename;
}

class GLatLngFieldsData implements GLatLngFields {
  const GLatLngFieldsData({
    required this.lat,
    required this.lng,
    this.G__typename = 'LatLngType',
  });

  factory GLatLngFieldsData.fromJson(Map<String, dynamic> json) {
    return GLatLngFieldsData(
      lat: (json['lat'] as double),
      lng: (json['lng'] as double),
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

  GLatLngFieldsData copyWith({
    double? lat,
    double? lng,
    String? G__typename,
  }) {
    return GLatLngFieldsData(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GLatLngFieldsData &&
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
    return 'GLatLngFieldsData(lat: $lat, lng: $lng, G__typename: $G__typename)';
  }
}
