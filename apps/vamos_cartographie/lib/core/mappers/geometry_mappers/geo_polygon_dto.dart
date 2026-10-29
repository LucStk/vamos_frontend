class GeoPolygonDto {
  /// Anneaux du polygone ; chaque point est [lng, lat].
  final List<List<List<double>>> rings;
  const GeoPolygonDto(this.rings);
}

GeoPolygonDto geoPolygonDtoFromJson(Object? json) {
  final rings = (json as List).map((ring) {
    return (ring as List).map((p) {
      final c = p as List;
      return [(c[0] as num).toDouble(), (c[1] as num).toDouble()];
    }).toList();
  }).toList();
  return GeoPolygonDto(rings);
}

Object? geoPolygonDtoToJson(GeoPolygonDto value) => value.rings;
