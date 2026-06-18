import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/application/application.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/markers/marker_ui_element.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/segment_ui_element.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

part 'segment_ui_provider.g.dart';

@riverpod
List<SegMarkerUiElement> segmentUiNotifier(Ref ref, Id<Trip> tripId) {
  final segments = ref.watch(collectionProvider<Segment>(tripId));

  return segments.entries.map((entries) {
    return SegMarkerUiElement(tripId, entries.value);
  }).toList();
}
