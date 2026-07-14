import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';
import 'package:trip_application/trip_application.dart';
import '/map/map.dart';

class CursorLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const CursorLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mapStateProvider(tripId).notifier);
    final mapState = ref.watch(mapStateProvider(tripId));
    switch (mapState.selection) {
      case CursorSelection cursorDrawn:
        return DragMarkers(
          markers: [
            DragMarker(
              point: cursorDrawn.latLng,
              size: const Size(26, 26),

              builder: (_, LatLng latLng, isDragging) => GestureDetector(
                onTap: () => notifier.sendUiEvent(CursorTapped(latLng)),
                onDoubleTap: () =>
                    notifier.sendUiEvent(CursorDoubleTapped(latLng)),
                child: Icon(Icons.place_sharp, size: 30, color: Colors.black),
              ),
              onDragUpdate: (_, LatLng latLng) =>
                  notifier.sendUiEvent(CursorDragUpdate(latLng)),
              onDragStart: (_, LatLng latLng) =>
                  notifier.sendUiEvent(CursorDraggedStart()),
              onDragEnd: (_, LatLng latLng) =>
                  notifier.sendUiEvent(CursorDraggedEnd(latLng)),
            ),
          ],
        );
      case _:
        return SizedBox.shrink();
    }
  }
}
