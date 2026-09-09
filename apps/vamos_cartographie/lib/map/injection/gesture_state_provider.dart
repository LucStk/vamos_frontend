import 'dart:math';

import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';

part 'gesture_state_provider.g.dart';

// lib/map/injection/gesture_state_provider.dart

@Riverpod(keepAlive: true)
class GestureStateNotifier extends _$GestureStateNotifier {
  @override
  GestureState build(TripId tripId) => const EmptyState();

  void update(GestureState newState) => state = newState;
}

@riverpod
bool isDragInProgress(Ref ref, TripId tripId) {
  final gestureState = ref.watch(gestureStateProvider(tripId));
  return gestureState is Dragging;
}

@Riverpod(keepAlive: true)
class CameraRevision extends _$CameraRevision {
  @override
  int build(TripId tripId) {
    final camera = ref.read(mapStateProvider(tripId).notifier).camera;

    final subscription = camera.cameraStream.listen((_) {
      state++;
    });

    ref.onDispose(subscription.cancel);

    return 0;
  }
}

@riverpod
Point<double>? pencilScreenPosition(Ref ref, TripId tripId) {
  ref.watch(cameraRevisionProvider(tripId));

  final state = ref.watch(mapStateProvider(tripId));

  if (state.selection is! MapSketchPencil) {
    return null;
  }

  if (state.mode case SketchMode m) {
    final position = m.pencilPositionOrNull;

    if (position == null) {
      return null;
    }

    final camera = ref.read(mapStateProvider(tripId).notifier).camera;

    final point = camera.latLngToPoint(position);

    return point;
  }

  return null;
}
