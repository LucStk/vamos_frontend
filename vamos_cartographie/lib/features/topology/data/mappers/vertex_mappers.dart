import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';

import "package:vamos_cartographie/features/shared/shared.dart";

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class VertexMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static Vertex fromGQL(GVertexFields data) =>
      Vertex(id: Id<Vertex>(data.id), latLng: GisMapper.fromGQL(data.latLng));
}
