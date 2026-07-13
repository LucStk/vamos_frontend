import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/rendering/elements/pencil_element.dart';
import 'package:vamos_cartographie/topology/injection/queries/queries.dart';
import '/map/map.dart';
import "/map/rendering/adapters/adapters.dart";

class SketchLayer extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  const SketchLayer({super.key, required this.tripId});

  @override
  ConsumerState<SketchLayer> createState() => _SketchLayerState();
}

class _SketchLayerState extends ConsumerState<SketchLayer> {
  late final ValueNotifier<LayerHitResult<SegmentRef>?> _polylineHitNotifier;

  @override
  void initState() {
    super.initState();
    _polylineHitNotifier = ValueNotifier<LayerHitResult<SegmentRef>?>(null);
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
    final mapStateNotifier = ref.read(mapStateProvider(widget.tripId).notifier);
    final mapState = ref.watch(mapStateProvider(widget.tripId));
    switch (mapState.mode) {
      case SketchMode e:
        final vertex = ref.read(
          vertexUiElementProvider(widget.tripId, e.vertexStart),
        );
        return Stack(
          children: [
            DragMarkers(
              markers: [
                toDragMarker(
                  PencilElement(widget.tripId, vertex.latLng),
                  widget.tripId,
                  mapStateNotifier,
                ),
              ],
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: [vertex.latLng, ...e.itineraire],
                  color: Colors.lightBlue,
                  strokeWidth: 5,
                ),
              ],
            ),
          ],
        );
      case _:
        return SizedBox.shrink();
    }
  }
}
