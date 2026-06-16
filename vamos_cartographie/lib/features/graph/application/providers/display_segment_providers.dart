import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/graph/domain/entities/display_segment.dart';
import 'package:vamos_cartographie/features/map/presentation/helpers/gis.dart';

part 'display_segment_providers.g.dart';

@riverpod
class DisplaySegmentNotifier extends _$DisplaySegmentNotifier {
  bool _isInit = true; // Cet état persiste tant que le provider est vivant !

  @override
  DisplaySegment build(Id<Trip> tripId, Id<Segment> segmentId) {
    // 1. On écoute les changements du segment.
    // Si le segment est modifié (rebuilt), on force _isInit à repasser à true.
    ref.listen<Segment?>(nodeProvider<Segment>(tripId, segmentId), (
      previous,
      next,
    ) {
      if (previous != next) {
        _isInit = true;
      }
    });
    final segment = ref.watch(nodeProvider<Segment>(tripId, segmentId));
    if (segment == null) {
      throw Exception('Segment not found');
    }
    final Vertex startVertex = ref.watch(
      nodeRequiredProvider<Vertex>(tripId, segment.startVertexId),
    );
    final Vertex endVertex = ref.watch(
      nodeRequiredProvider<Vertex>(tripId, segment.endVertexId),
    );
    if (_isInit) {
      _isInit = false;
      // Sera false au prochain changement de startVertex/endVertex
      return DisplaySegment(segment: segment, geometry: segment.geometry);
    }

    // base correspond à votre géométrie initiale (segment.geometry par exemple)
    final geometry = [startVertex.latLng, endVertex.latLng];

    return DisplaySegment(segment: segment, geometry: geometry);
  }
}

@riverpod
LatLng segmentMarkerLatLng(Ref ref, Id<Trip> tripId, Id<Segment> segmentId) {
  final display = ref.watch(displaySegmentProvider(tripId, segmentId));
  return boundsCenter(display.geometry);
}
