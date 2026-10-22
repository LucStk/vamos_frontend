import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';

sealed class MenuAnchor {
  const MenuAnchor();
}

final class VertexAnchor extends MenuAnchor {
  const VertexAnchor(this.object);
  final MapWaypoint object;
}

final class PencilAnchor extends MenuAnchor {
  const PencilAnchor(this.object);
  final MapSketchPencil object;
}

final class TripOriginAnchor extends MenuAnchor {
  const TripOriginAnchor(this.object);
  final MapTripOrigin object;
}

final class GeoAnchor extends MenuAnchor {
  const GeoAnchor(this.position);
  final WorldOffset position;
}
