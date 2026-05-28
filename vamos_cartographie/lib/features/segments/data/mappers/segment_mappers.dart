import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_mappers.dart';

import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class SegmentMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static Segment segmentFromGQL(GSegmentFieldsData data) => Segment(
    type: data.type,
    intermediatePoints: data.intermediatePoints
        .map((p) => LatLng(p.lat, p.lng))
        .toList(),
  );

  /// Convertit un [Segment] domaine en [GSegmentInput] pour les mutations.
  // static GSegmentInput toGQLInput(Segment s) => GSegmentInput(
  //   type: s.type,
  //   intermediatePoints: s.intermediatePoints
  //       .map((p) => GLatLngInput(lat: p.latitude, lng: p.longitude))
  //       .toList(),
  // );
}
