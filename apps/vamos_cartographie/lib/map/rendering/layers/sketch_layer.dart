import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/topology/topology.dart';
import '/map/map.dart';

class SketchLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  final ValueNotifier<LayerHitResult<NotifierHit>?> hitNotifier;
  const SketchLayer({
    super.key,
    required this.tripId,
    required this.hitNotifier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapStateNotifier = ref.read(mapStateProvider(tripId).notifier);
    final mapState = ref.watch(mapStateProvider(tripId));
    switch (mapState.mode) {
      case Sketch e:
        final vertex = ref.read(vertexProvider(tripId, e.vertexStart));
        final mapController = MapController.of(context);
        final allVertices = ref.watch(allVertexProvider(tripId));
        final candidateVertices = allVertices
            .where((v) => v.id != e.vertexStart)
            .toList();
        final sketchRoad = [vertex.latLng, ...e.itineraire];
        return Stack(
          children: [
            PolylineLayer<NotifierHit>(
              hitNotifier: hitNotifier,
              polylines: [
                Polyline<NotifierHit>(
                  points: sketchRoad,
                  color: Colors.lightBlue,
                  strokeWidth: 5,
                  hitValue: SketchSegmentHit(),
                ),
              ],
            ),
            DragMarkers(
              markers: [
                DragMarker(
                  point: sketchRoad.last,
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
                      vertices: candidateVertices,
                      mapController: mapController,
                    );
                    mapStateNotifier.sendUiEvent(
                      SketchDragUpdate(latLng: latLng, touchedVertex: hit?.id),
                    );
                  },
                  onDragStart: (_, LatLng latLng) =>
                      mapStateNotifier.sendUiEvent(SketchDraggedStart()),

                  onDragEnd: (_, LatLng latLng) =>
                      mapStateNotifier.sendUiEvent(SketchDraggedEnd(latLng)),
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
