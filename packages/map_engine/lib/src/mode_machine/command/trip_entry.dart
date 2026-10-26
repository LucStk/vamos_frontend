import 'package:domain_core/failures.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/mode_machine/app_scope.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:trip_application/trip_application.dart';

sealed class TripEntry {
  const TripEntry();
}

final class TripReadOnly extends TripEntry {
  const TripReadOnly();
}

final class TripReady extends TripEntry {
  const TripReady();
}

final class TripNeedsOrigin extends TripEntry {
  const TripNeedsOrigin(this.from);
  final WorldOffset from;
}

final class ResolveTripEntry extends Command<TripEntry> {
  const ResolveTripEntry(this.tripId);
  final TripId tripId;

  @override
  Future<TripEntry> handle(AppCommandScope n) async {
    final trip = n.forTrip(tripId).trip;
    final userId = n.currentUserId;

    // Pas connecté ou pas propriétaire : lecture seule.
    if (userId == null || trip.ownerId != userId) {
      return const TripReadOnly();
    }

    final route = n.forTrip(tripId).route;
    if (route != null && route.geometry.isNotEmpty) return const TripReady();
    final origin = route?.startPoint;

    if (origin == null) {
      throw NotFoundFailure(
        resourceId: "startPoint",
        resourceType: "route startPoint",
      );
    }

    return TripNeedsOrigin(n.camera.latLngToWorldOffset(origin));
  }
}
