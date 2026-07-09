import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/domain/domain.dart';

part 'map_output_notifier.g.dart';

@riverpod
class MapOutputNotifier extends _$MapOutputNotifier implements MapOutput {
  @override
  MapOutputQueue build(TripId tripId) {
    return MapOutputQueue.empty();
  }

  @override
  void emit(MapOutputEvent event) {
    state = state.enqueue(event);
  }

  MapOutputEvent? pop() {
    if (state.isEmpty) return null;

    final queue = state.queue;
    final event = queue.removeFirst();

    state = MapOutputQueue(queue);

    return event;
  }
}
