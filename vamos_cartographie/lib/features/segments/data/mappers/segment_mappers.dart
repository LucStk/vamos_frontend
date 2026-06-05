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
    // Note: geometry is now stored separately on the server side
    // For now, we create an empty list. The geometry will be calculated client-side
    // or fetched separately if needed
    startVertexId: data.startVertex.id,
    endVertexId: data.endVertex.id,
  );
}
