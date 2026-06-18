import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/interaction/ui_events/ui_events.dart';

class SegmentLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const SegmentLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segments = ref.watch(collectionProvider<Segment>(tripId));
    final mapCtrl = ref.read(mapCtrlProvider(tripId).notifier);
    final polylines = segments.entries.map((entry) {
      final sId = entry.key;
      final segment = entry.value;
      return Polyline(
        points: segment.geometry,
        color: segment.mobilityType.color,
        strokeWidth: 5,
        hitValue: sId,
        pattern: segment.mobilityType.isDashed
            ? StrokePattern.dashed(segments: const [12, 8])
            : const StrokePattern.solid(),
      );
    }).toList(); // <--- On transforme le tout en List<Polyline>
    // 1. On crée le notifier de manière standard
    final polylineHitNotifier = ValueNotifier<LayerHitResult<Id<Segment>>?>(
      null,
    );

    polylineHitNotifier.addListener(() {
      mapCtrl.onUiEvent(HoverSegments(polylineHitNotifier.value?.hitValues));
    });
    // 3. On le passe au PolylineLayer
    return PolylineLayer<Id<Segment>>(
      hitNotifier: polylineHitNotifier,
      polylines: polylines,
    );
  }
}
