import 'package:api_client/api_client.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/domain/domain.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class TripMapper {
  // ---------------------------------------------------------------------------
  // GQL → Domaine
  // ---------------------------------------------------------------------------

  /// Convertit un [GWaypointFieldsData] (fragment GQL) en [Waypoint] domaine.
  static Waypoint waypointFromGQL(GWaypointFieldsData data) => Waypoint(
    id: data.id,
    latLng: LatLng(data.lat, data.lng),
    type: data.type,
    title: data.title,
    description: data.description,
    images: data.images.map((i) => i.image.fileKey).toList(),
  );

  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static Segment segmentFromGQL(GSegmentFieldsData data) => Segment(
    type: data.type,
    intermediatePoints: data.intermediatePoints
        .map((p) => LatLng(p.lat, p.lng))
        .toList(),
  );

  /// Convertit un [GTripFieldsData] (fragment de base, sans waypoints ni
  /// segments) en [Trip] domaine. Utilisé pour la liste de trips.
  static Trip tripFromGQLFields(GTripFieldsData data) => Trip(
    id: data.id.toString(),
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
    images: data.images.map((i) => i.image.fileKey).toList(),
  );

  /// Convertit un [GGetTripData_trip] (query détaillée, avec waypoints et
  /// segments) en [Trip] domaine.
  static Trip tripFromGQLDetail(GGetTripData_trip data) => Trip(
    id: data.id.toString(),
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
    images: data.images.map((i) => i.image.fileKey).toList(),
    waypoints: data.waypoints.map(waypointFromGQL).toList(),
    segments: data.segments.map(segmentFromGQL).toList(),
  );

  /// Convertit le résultat de la mutation createTrip en [Trip] domaine.
  static Trip tripFromGQLCreateResult(GCreateTripData_createTrip data) => Trip(
    id: data.id.toString(),
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
    images: data.images.map((i) => i.image.fileKey).toList(),
    waypoints: data.waypoints.map(waypointFromGQL).toList(),
    segments: data.segments.map(segmentFromGQL).toList(),
  );

  /// Convertit le résultat de la mutation updateTrip en [Trip] domaine.
  static Trip tripFromGQLUpdateResult(GUpdateTripData_updateTrip data) => Trip(
    id: data.id.toString(),
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
    images: data.images.map((i) => i.image.fileKey).toList(),
    waypoints: data.waypoints.map(waypointFromGQL).toList(),
    segments: data.segments.map(segmentFromGQL).toList(),
  );

  // ---------------------------------------------------------------------------
  // Domaine → GQL Input
  // ---------------------------------------------------------------------------

  /// Convertit un [Waypoint] domaine en [GWaypointInput] pour les mutations.
  static GWaypointInput waypointToGQLInput(Waypoint w) => GWaypointInput(
    lat: w.latLng.latitude,
    lng: w.latLng.longitude,
    type: w.type,
    description: w.description != null && w.description!.isNotEmpty
        ? Value.present(w.description)
        : const Value.absent(),
  );

  /// Convertit un [Segment] domaine en [GSegmentInput] pour les mutations.
  static GSegmentInput segmentToGQLInput(Segment s) => GSegmentInput(
    type: s.type,
    intermediatePoints: s.intermediatePoints
        .map((p) => GLatLngInput(lat: p.latitude, lng: p.longitude))
        .toList(),
  );

  /// Convertit un [Trip] domaine en [GTripInput] pour la mutation createTrip.
  static GTripInput tripToGQLInput(Trip trip) => GTripInput(
    title: trip.title,
    description: trip.description.isNotEmpty
        ? Value.present(trip.description)
        : const Value.absent(),
    date: trip.date != null
        ? Value.present(trip.date!.toIso8601String().substring(0, 10))
        : const Value.absent(),
    waypoints: trip.waypoints.isNotEmpty
        ? Value.present(trip.waypoints.map(waypointToGQLInput).toList())
        : const Value.absent(),
    segments: trip.segments.isNotEmpty
        ? Value.present(trip.segments.map(segmentToGQLInput).toList())
        : const Value.absent(),
  );

  /// Convertit un [Trip] domaine en [GTripUpdateInput] pour la mutation
  /// updateTrip. Tous les champs sont envoyés tels quels (remplacement complet).
  static GTripUpdateInput tripToGQLUpdateInput(Trip trip) => GTripUpdateInput(
    title: Value.present(trip.title),
    description: Value.present(
      trip.description.isNotEmpty ? trip.description : null,
    ),
    date: trip.date != null
        ? Value.present(trip.date!.toIso8601String().substring(0, 10))
        : const Value.absent(),
    waypoints: Value.present(trip.waypoints.map(waypointToGQLInput).toList()),
    segments: Value.present(trip.segments.map(segmentToGQLInput).toList()),
  );
}
