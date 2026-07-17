import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/rendering/helpers/vertex_hit_test.dart';
import 'package:vamos_cartographie/topology/topology.dart';
import '/map/map.dart';

class SketchLayer extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  const SketchLayer({super.key, required this.tripId});

  @override
  ConsumerState<SketchLayer> createState() => _SketchLayerState();
}

class _SketchLayerState extends ConsumerState<SketchLayer> {
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
    final mapStateNotifier = ref.read(mapStateProvider(widget.tripId).notifier);
    final mapState = ref.watch(mapStateProvider(widget.tripId));
    switch (mapState.mode) {
      case SketchMode e:
        final vertex = ref
            .read(vertexProvider(widget.tripId, e.vertexStart))
            .display;
        final mapController = MapController.of(context);
        final allVertices = ref.watch(allVertexProvider(widget.tripId));
        return Stack(
          children: [
            PolylineLayer(
              polylines: [
                Polyline(
                  points: [vertex.latLng, ...e.itineraire],
                  color: Colors.lightBlue,
                  strokeWidth: 5,
                ),
              ],
            ),
            DragMarkers(
              markers: [
                DragMarker(
                  point: vertex.latLng,
                  size: const Size(26, 26),

                  builder: (_, LatLng latLng, isDragging) => GestureDetector(
                    onTap: () =>
                        mapStateNotifier.sendUiEvent(PencilTapped(latLng)),
                    onDoubleTap: () => mapStateNotifier.sendUiEvent(
                      PencilDoubleTapped(latLng),
                    ),
                    child: Icon(
                      Icons.draw_sharp,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  onDragUpdate: (_, LatLng latLng) {
                    final hit = findNearbyVertex(
                      point: latLng,
                      vertices: allVertices,
                      mapController: mapController,
                    );
                    mapStateNotifier.sendUiEvent(
                      PencilDragUpdate(latLng: latLng, touchedVertex: hit?.id),
                    );
                  },
                  onDragStart: (_, LatLng latLng) =>
                      mapStateNotifier.sendUiEvent(PencilDraggedStart()),

                  onDragEnd: (_, LatLng latLng) =>
                      mapStateNotifier.sendUiEvent(PencilDraggedEnd(latLng)),
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
