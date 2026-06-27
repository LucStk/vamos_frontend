import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';

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
  static Trip fromGQLDetail(GTripFieldsData data) => Trip(
    id: Id<Trip>(data.id),
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
  );

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
