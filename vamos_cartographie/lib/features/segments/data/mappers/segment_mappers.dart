import 'package:vamos_cartographie/features/segments/segments.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:latlong2/latlong.dart';
import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";
import "segment_type_mapper.dart";

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class SegmentMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static Segment fromGQL(GSegmentFields data) => Segment(
    id: data.id,
    type: data.type.toDomain(),
    middleVertices: data.geometry.indexed
        .map(
          (e) => SegmentVertex(
            id: "${data.id}-${e.$1}",
            point: LatLng(e.$2.lat, e.$2.lng),
          ),
        )
        .toList(),
    startWaypointId: data.startWaypoint.id,
    endWaypointId: data.endWaypoint.id,
  );
}
