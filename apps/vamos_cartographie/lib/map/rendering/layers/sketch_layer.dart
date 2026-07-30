import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/hit_engine/hit_engine.dart';
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
    final hitNotifier = ref.watch(hitLayerProvider);
    switch (mapState.mode) {
      case Sketch e:
        return Stack(
          children: [
            PolylineLayer<MapHit>(
              hitNotifier: hitNotifier,
              polylines: [
                // Le segment en cours
                Polyline<MapHit>(
                  points: e.itineraire,
                  color: Colors.lightBlue,
                  strokeWidth: 5,
                  hitValue: SketchSegmentHit(),
                ),

                // La modification en direct si elle existe
                if (e.correction != null)
                  Polyline<MapHit>(
                    points: e.correction!.path,
                    color: Colors.lightBlue,
                    strokeWidth: 5,
                    hitValue: SketchSegmentHit(),
                  ),
              ],
            ),

            MarkerLayer(
              markers: [
                Marker(
                  point: e.correction?.path.last ?? e.itineraire.last,
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
