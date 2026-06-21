import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class TripDraftMapper {
  static GTripInput toGQLInput(TripDraft trip) => GTripInput(
    title: trip.title,
    description: trip.description.isNotEmpty
        ? Value.present(trip.description)
        : const Value.absent(),
    date: trip.date != null
        ? Value.present(trip.date!.toIso8601String().substring(0, 10))
        : const Value.absent(),
  );

  static GTripUpdateInput toGQLUpdateInput(TripDraft trip) => GTripUpdateInput(
    title: Value.present(trip.title),
    description: Value.present(
      trip.description.isNotEmpty ? trip.description : null,
    ),
    date: trip.date != null
        ? Value.present(trip.date!.toIso8601String().substring(0, 10))
        : const Value.absent(),
  );
}
