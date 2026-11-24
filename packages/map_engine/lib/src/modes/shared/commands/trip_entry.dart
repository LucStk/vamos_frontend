import 'package:domain_core/domain_core.dart';

import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:trip_application/trip_application.dart';

sealed class TripEntry {
  const TripEntry();
}

final class TripUnavailable extends TripEntry {
  const TripUnavailable();
}

final class TripReady extends TripEntry {
  const TripReady({this.readOnly = true});
  final bool readOnly;
}

final class ResolveTripEntry extends Command<TripEntry> {
  const ResolveTripEntry(this.tripId);
  final TripId tripId;

  @override
  Future<TripEntry> handle(AppCommandScope n) async {
    if (await n.forTrip(tripId).ensureTripLoaded() != null) {
      return const TripUnavailable();
    }
    final trip = n.forTrip(tripId).trip;
    final userId = n.currentUserId;

    // Pas connecté ou pas propriétaire : lecture seule.
    if (userId == null || trip.ownerId != userId) {
      return const TripReady(readOnly: true);
    }

    // Un voyage qui n'a encore que son départ s'ouvre comme les autres : on y
    // trace depuis l'origine et on la déplace, l'interface s'en charge.
    if (n.forTrip(tripId).route == null) {
      throw NotFoundFailure(
        resourceId: "startPoint",
        resourceType: "route startPoint",
      );
    }

    return const TripReady(readOnly: false);
  }
}
