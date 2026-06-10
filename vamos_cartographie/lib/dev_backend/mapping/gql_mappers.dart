import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_enum_mapper.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/segment_type_mapper.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

// ── Conversions domaine → types Ferry générés ─────────────────────────────────
//
// Fonctions pures : aucun accès au store.
// Utilisées à la frontière GraphQL pour construire les réponses Ferry.

GImageFieldsData imageToGql(MediaImage img) =>
    GImageFieldsData(fileKey: img.fileKey, url: img.url);

GLatLngFieldsData latLngToGql(double lat, double lng) =>
    GLatLngFieldsData(lat: lat, lng: lng);

GVertexFieldsData vertexToGql(Vertex v) => GVertexFieldsData(
  id: v.id,
  latLng: latLngToGql(v.latLng.latitude, v.latLng.longitude),
);

/// Construit un [GWaypointFieldsData] à partir d'un [Waypoint] et de son [Vertex].
///
/// Le [vertex] doit être le vertex dont l'id == [w.vertexId].
GWaypointFieldsData waypointToGql(Waypoint w, Vertex vertex) =>
    GWaypointFieldsData(
      id: w.id,
      title: w.title,
      description: w.description,
      type: w.type.toGQL(),
      vertex: vertexToGql(vertex),
      images: w.images
          .map((img) => GWaypointFieldsData_images(image: imageToGql(img)))
          .toList(),
    );

GCreateWaypointPayloadFieldsData waypointCreateToGql(
  Waypoint w,
  Vertex vertex,
) => GCreateWaypointPayloadFieldsData(
  waypoint: waypointToGql(w, vertex),
  vertex: vertexToGql(vertex),
);

/// Construit un [GSegmentFieldsData] à partir d'un [Segment] et de ses deux [Vertex].
GSegmentFieldsData segmentToGql(Segment s, Vertex start, Vertex end) =>
    GSegmentFieldsData(
      id: s.id,
      type: s.type.toGQL(),
      startVertex: vertexToGql(start),
      endVertex: vertexToGql(end),
      geometry: s.geometry
          .map((ll) => GLatLngFieldsData(lat: ll.latitude, lng: ll.longitude))
          .toList(),
    );

/// Construit un [GTripFieldsData] (fragment de base, sans waypoints ni topology).
GTripFieldsData tripFieldsToGql(Trip t) => GTripFieldsData(
  id: t.id,
  title: t.title,
  description: t.description,
  date: t.date?.toIso8601String().substring(0, 10),
  images: t.images
      .map((img) => GTripFieldsData_images(image: imageToGql(img)))
      .toList(),
);
