import 'package:trip_application/trip/domain/trip.dart';
import '../effect/results.dart';
import 'command.dart';

sealed class ExploreCommand<R extends Object> extends Command<Done, Never> {
  const ExploreCommand();
}

final class FocusTrip extends ExploreCommand<Done> {
  const FocusTrip(this.tripId);
  final TripId tripId;
  @override
  Future<Done> handle(Never n) async {
    return const Done();
  }
}
