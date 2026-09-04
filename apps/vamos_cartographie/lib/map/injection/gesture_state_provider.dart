import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';

part 'gesture_state_provider.g.dart';

// lib/map/injection/gesture_state_provider.dart
@riverpod
class GestureStateNotifier extends _$GestureStateNotifier {
  @override
  GestureState build(TripId tripId) => const EmptyState();

  void update(GestureState newState) => state = newState;
}
