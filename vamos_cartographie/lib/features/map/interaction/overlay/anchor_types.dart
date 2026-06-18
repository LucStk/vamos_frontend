part of "anchor.dart";

class VertexAnchor extends OverlayAnchor {
  final Id<Vertex> id;
  const VertexAnchor(this.id);
}

class WaypointAnchor extends OverlayAnchor {
  final Id<Waypoint> id;
  const WaypointAnchor(this.id);
}

class CursorAnchor extends OverlayAnchor {
  final LatLng latLng;
  const CursorAnchor(this.latLng);
}

class ScreenAnchor extends OverlayAnchor {
  final Offset offset;
  const ScreenAnchor(this.offset);
}
