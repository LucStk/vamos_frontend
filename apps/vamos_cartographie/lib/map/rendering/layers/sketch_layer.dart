import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import '/map/map.dart';

class SketchLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const SketchLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider(tripId));
    final hitNotifier = ref.watch(sketchHitLayerProvider);
    switch (mapState.mode) {
      case SketchMode e:
        final pencilPosition = e.pencilPositionOrNull;
        if (pencilPosition == null) {
          return SizedBox.shrink();
        }
        // final List<Widget> children = [];
        final List<Polyline<MapElement>> polylineLayer = [];

        if (e.correction != null) {
          polylineLayer.add(
            Polyline<MapElement>(
              points: e.correction!.path,
              color: Colors.green,
              strokeWidth: 5,
            ),
          );
        }
        if (e is SketchCreation) {
          polylineLayer.add(
            Polyline<MapElement>(
              points: e.itineraire,
              color: Colors.lightBlue,
              strokeWidth: 5,
              hitValue: MapSketchSegment(),
            ),
          );
        }
        return Stack(
          children: [
            PolylineLayer<MapElement>(
              hitNotifier: hitNotifier,
              polylines: polylineLayer,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: pencilPosition,
                  child: Icon(Icons.draw_sharp, size: 30, color: Colors.black),
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
