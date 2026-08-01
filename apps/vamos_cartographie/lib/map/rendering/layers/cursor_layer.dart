import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import '/map/map.dart';

class CursorLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const CursorLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider(tripId));
    final hitNotifier = ref.watch(cursorHitLayerProvider);

    switch (mapState.selection) {
      case CursorSelection cursorDrawn:
        return Stack(
          children: [
            CircleLayer<MapHit>(
              hitNotifier: hitNotifier,
              circles: [
                CircleMarker<MapHit>(
                  point: cursorDrawn.latLng,
                  radius: 24,
                  color: const Color(0x00000000),
                  hitValue: CursorHit(),
                ),
              ],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: cursorDrawn.latLng,
                  width: 26,
                  height: 26,
                  child: Icon(Icons.place_sharp, size: 30, color: Colors.black),
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
