import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/models/markers/marker_ui_element.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:domain_core/domain_core.dart';

part 'segment_ui_provider.g.dart';

@riverpod
List<SegMarkerUiElement> segmentUiNotifier(Ref ref, Id<Trip> tripId) {
  final segments = ref.watch(collectionProvider<Segment>(tripId));

  return segments.entries.map((entries) {
    return SegMarkerUiElement(tripId, entries.value);
  }).toList();
}
