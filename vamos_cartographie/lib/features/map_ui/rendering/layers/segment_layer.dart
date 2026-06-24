import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map_editor/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/map_editor/events/ui/ui_events.dart';
import 'package:vamos_cartographie/features/map_ui/adapters/marker_adapter.dart';
import 'package:vamos_cartographie/features/map_ui/adapters/segment_adapter.dart';

class SegmentLayer extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  const SegmentLayer({super.key, required this.tripId});

  @override
  ConsumerState<SegmentLayer> createState() => _SegmentLayerState();
}

class _SegmentLayerState extends ConsumerState<SegmentLayer> {
  late final ValueNotifier<LayerHitResult<Id<Segment>>?> _polylineHitNotifier;

  @override
  void initState() {
    super.initState();
    _polylineHitNotifier = ValueNotifier<LayerHitResult<Id<Segment>>?>(null);

    _polylineHitNotifier.addListener(_onHoverChanged);
  }

  void _onHoverChanged() {
    // ref est accessible partout dans le State d'un ConsumerStatefulWidget
    ref
        .read(mapCtrlProvider(widget.tripId).notifier)
        .onUiEvent(HoverSegments(_polylineHitNotifier.value?.hitValues));
  }

  @override
  void dispose() {
    _polylineHitNotifier.removeListener(_onHoverChanged);
    _polylineHitNotifier.dispose(); // Nettoyage propre
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final segments = ref.watch(segmentUiProvider(widget.tripId));
    final mapCtrl = ref.read(mapCtrlProvider(widget.tripId).notifier);

    final polylines =
        segments
                .map(
                  (entry) => toPolyline(entry.segment, widget.tripId, mapCtrl),
                )
                .toList()
            as List<Polyline<Id<Segment>>>;
    // On en profite pour construire les markers mobility sur les segments
    final segMarkers = segments
        .map((entry) => toMarker(entry, widget.tripId, mapCtrl))
        .toList();

    return Stack(
      children: [
        PolylineLayer<Id<Segment>>(
          hitNotifier: _polylineHitNotifier,
          polylines: polylines,
        ),
        MarkerLayer(markers: segMarkers),
      ],
    );
  }
}
