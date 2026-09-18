import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';

part 'trip_map_state.g.dart';

@Riverpod(keepAlive: true)
class TripMapStateNotifier extends _$TripMapStateNotifier {
  @override
  TripMapState build(TripId tripId) => const Idle();

  /// Change le mode ou la sélection actuelle
  void emit(TripMapState newState) => state = newState;
}
