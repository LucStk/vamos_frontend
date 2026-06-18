import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/interaction/ui_events/ui_events.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/builders/segment_polyline_builder.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/layer_abstract.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

class SegmentLayer extends AbstractLayer {
  const SegmentLayer({super.key, required super.tripId});

  @override
  Widget buildWithCtrl(BuildContext context, WidgetRef ref, MapCtrl mapCtrl) {
    final ids = ref.watch(
      collectionProvider<Segment>(super.tripId).select((m) => m.keys.toList()),
    );
    final segments = ref.watch(collectionProvider<Segment>(super.tripId));
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }
    final List<Polyline<Id<Segment>>> polylines = [];
    for (final id in ids) {
      polylines.add(segmentPolylineBuilder(ref, super.tripId, id));
    }
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
