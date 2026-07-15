import 'dart:collection';

import 'package:map_application/output_events/output_events.dart';

abstract interface class MapOutput {
  void emit(MapOutputEvent event);
}

class MapOutputQueue {
  final Queue<MapOutputEvent> _queue;

  const MapOutputQueue(this._queue);

  factory MapOutputQueue.empty() => MapOutputQueue(Queue());

  MapOutputQueue enqueue(MapOutputEvent event) =>
      MapOutputQueue(Queue.of([..._queue, event]));

  bool get isEmpty => _queue.isEmpty;

  Queue<MapOutputEvent> get queue => Queue.of(_queue);
}
