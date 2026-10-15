import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';

sealed class MenuAnchor {
  const MenuAnchor();
}

/// Suit un objet de la carte (vertex, segment...).
final class ObjectAnchor extends MenuAnchor {
  const ObjectAnchor(this.object);
  final MapObject object;
}

/// Point géographique fixe : suit la carte, pas l'écran (ex. appui long sur le vide).
final class GeoAnchor extends MenuAnchor {
  const GeoAnchor(this.position);
  final LatLng position;
}

/// Position écran figée (cas rare).
final class ScreenAnchor extends MenuAnchor {
  const ScreenAnchor(this.at);
  final ScreenOffset at;
}
