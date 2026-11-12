import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.data.gql.dart';

// extension BoundsMapper on List<dynamic> {
//   MapLatLngBounds toDomain() {
//     final ring = first as List<dynamic>; // anneau extérieur
//
//     final points = ring.map((p) {
//       final coords = p as List<dynamic>;
//       final lng = (coords[0] as num).toDouble();
//       final lat = (coords[1] as num).toDouble();
//       return LatLng(lat, lng); // attention à l'inversion
//     });
//
//     return MapLatLngBounds.fromPoints(points);
//   }
// }
//

extension BoundsMapper on GBounds {
  /// Emprise du serveur (min/max) vers les quatre bords de la carte.
  MapLatLngBounds toMapBounds() {
    assert(
      minLat <= maxLat && minLng <= maxLng,
      'emprise incohérente : $minLng,$minLat → $maxLng,$maxLat',
    );
    return MapLatLngBounds(
      north: maxLat,
      south: minLat,
      east: maxLng,
      west: minLng,
    );
  }
}
