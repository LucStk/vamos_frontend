import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:media_application/domain/entities/media_image.dart';
import 'package:trip_domain/domain/types/topology_res.dart';
import 'package:vamos_cartographie/core/infrastructure/topology/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/core/infrastructure/topology/mappers/vertex_mappers.dart';
import 'package:vamos_cartographie/core/infrastructure/waypoint/mappers/mappers.dart';
import '/core/graphql/graphql.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import '/core/infrastructure/media/media.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class TripMapper {
  /// segments) en [Trip] domaine. Utilisé pour la liste de trips.
  static Trip fromGQLFields(GTripFieldsData data) => Trip(
    id: Id<Trip>(data.id),
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
  );

  /// Convertit un [GGetTripData_trip] (query détaillée, avec waypoints et
  /// segments) en [Trip] domaine.
  static (Trip, List<MediaImage>) fromGQLDetail(GTripFieldsData data) {
    final trip = Trip(
      id: Id<Trip>(data.id),
      title: data.title,
      description: data.description,
      date: data.date != null ? DateTime.parse(data.date!) : null,
    );
    final images = data.images
        .map((i) => MediaImageMappers.fromGQL(i))
        .toList();
    return (trip, images);
  }

  static TripDetailsRes fromGQLDetails(GGetTripDetailsData_trip data) {
    final lV = data.topology.vertices.map(VertexMapper.fromGQL).toList();
    final lS = data.topology.segments.map(SegmentMapper.fromGQL).toList();
    final lW = data.waypoints.map(WaypointMapper.fromGQL).toList();
    return TripDetailsRes(lV, lS, lW);
  }

  /// Convertit le résultat de la mutation createTrip en [Trip] domaine.
  static Trip fromGQLCreateResult(GTripFields data) => Trip(
    id: Id<Trip>(data.id),
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
  );

  /// Convertit le résultat de la mutation updateTrip en [Trip] domaine.
  static Trip fromGQLUpdateResult(GTripFields data) => Trip(
    id: Id<Trip>(data.id),
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
  );

  static GTripUpdateInput toGQLUpdateInput(Trip trip) => GTripUpdateInput(
    title: Value.present(trip.title),
    description: trip.description.isNotEmpty
        ? Value.present(trip.description)
        : const Value.absent(), // ne pas envoyer si vide
    date: trip.date != null
        ? Value.present(trip.date!.toIso8601String().substring(0, 10))
        : const Value.absent(),
  );
}
