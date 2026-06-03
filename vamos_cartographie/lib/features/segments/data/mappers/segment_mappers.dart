import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:latlong2/latlong.dart';
import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class SegmentMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static Segment fromGQL(GSegmentFields data) => Segment(
    id: data.id,
    type: data.type,
    intermediatePoints: data.intermediatePoints
        .map((p) => LatLng(p.lat, p.lng))
        .toList(),
    startWaypointId: data.startWaypoint.id,
    endWaypointId: data.endWaypoint.id,
  );
}
