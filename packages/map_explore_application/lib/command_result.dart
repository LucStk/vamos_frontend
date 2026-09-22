import 'package:trip_application/trip/domain/domain.dart';

sealed class CommandResult {
  const CommandResult();
}

/// Rien à répercuter (échec, segment introuvable, vertex créé…)
final class NoResult extends CommandResult {
  const NoResult();
}

final class TripSelected extends CommandResult {
  const TripSelected(this.tripId);
  final TripId tripId;
}
