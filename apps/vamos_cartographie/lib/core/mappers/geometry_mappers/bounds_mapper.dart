import 'package:domain_core/map_geo_bounds.dart';
import 'package:latlong2/latlong.dart';

extension BoundsMapper on List<dynamic> {
  MapLatLngBounds toDomain() {
    final ring = first as List<dynamic>; // anneau extérieur

    final points = ring.map((p) {
      final coords = p as List<dynamic>;
      final lng = (coords[0] as num).toDouble();
      final lat = (coords[1] as num).toDouble();
      return LatLng(lat, lng); // attention à l'inversion
    });

    return MapLatLngBounds.fromPoints(points);
  }
}
