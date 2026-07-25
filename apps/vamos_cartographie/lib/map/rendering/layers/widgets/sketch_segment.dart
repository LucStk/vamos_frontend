import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';
import 'package:trip_application/trip_application.dart';
import '/map/map.dart';

class SketchSegment extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  const SketchSegment({super.key, required this.tripId});

  @override
  ConsumerState<SketchSegment> createState() => _SketchSegmentState();
}

class _SketchSegmentState extends ConsumerState<SketchSegment> {
  late final ValueNotifier<LayerHitResult<SegmentId>?> _polylineHitNotifier;

  @override
  void initState() {
    super.initState();
    _polylineHitNotifier = ValueNotifier<LayerHitResult<SegmentId>?>(null);
    _polylineHitNotifier.addListener(_onHoverChanged);
  }

  void _onHoverChanged() {
    // ref est accessible partout dans le State d'un ConsumerStatefulWidget
    ref
        .read(mapStateProvider(widget.tripId).notifier)
        .sendUiEvent(HoverSketchItineraire());
  }

  @override
  void dispose() {
    _polylineHitNotifier.removeListener(_onHoverChanged);
    _polylineHitNotifier.dispose(); // Nettoyage propre
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapMode = ref.watch(
      mapStateProvider(widget.tripId).select((s) => s.mode),
    );

    switch (mapMode) {
      case SketchMode e:
        return PolylineLayer(
          polylines: [
            Polyline(
              points: e.itineraire,
              color: Colors.lightBlue,
              strokeWidth: 5,
            ),
          ],
        );
      case _:
        return SizedBox.shrink();
    }
  }
}
