import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:vamos_cartographie/features/topology/data/providers/segments_providers.dart";
import "package:vamos_cartographie/core/injection/client_provider.dart";
import 'package:vamos_cartographie/features/topology/topology.dart';
part 'segments_notifier.g.dart';

@riverpod
Map<int, Segment> segmentMap(Ref ref, int tripId) {
  return ref.watch(segmentsProvider(tripId)).value ?? const {};
}

@riverpod
List<int> segmentIds(Ref ref, int tripId) {
  return ref.watch(
    segmentMapProvider(tripId).select((map) => map.keys.toList()),
  );
}

@riverpod
Segment? segmentById(Ref ref, int tripId, int segmentId) {
  return ref.watch(segmentMapProvider(tripId).select((map) => map[segmentId]));
}
