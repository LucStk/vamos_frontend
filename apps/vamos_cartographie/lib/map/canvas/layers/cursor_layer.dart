import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import '/map/map.dart';

class CursorLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const CursorLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(
      mapStateProvider(tripId).select((m) => m.selection),
    );

    switch (selection) {
      case MapCursor cursorDrawn:
        return MarkerLayer(
          markers: [
            Marker(
              point: cursorDrawn.latLng,
              width: 26,
              height: 26,
              child: Icon(Icons.place_sharp, size: 30, color: Colors.black),
            ),
          ],
        );

      case _:
        return SizedBox.shrink();
    }
  }
}
