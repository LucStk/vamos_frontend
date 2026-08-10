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
      case SketchCreation e:
        final pencilPosition = e.pencilPositionOrNull;
        if (pencilPosition == null) {
          return SizedBox.shrink();
        }
        return Stack(
          children: [
            PolylineLayer<MapElement>(
              hitNotifier: hitNotifier,
              polylines: [
                // Le segment en cours
                Polyline<MapElement>(
                  points: e.itineraire,
                  color: Colors.lightBlue,
                  strokeWidth: 5,
                  hitValue: MapSketchSegment(),
                ),

                // La modification en direct si elle existe
                if (e.correction != null)
                  Polyline<MapElement>(
                    points: e.correction!.path,
                    color: Colors.green,
                    strokeWidth: 5,
                  ),
              ],
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
