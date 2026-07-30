import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/hit_engine/hit_engine.dart';
import 'package:map_application/map_application.dart';

mixin MapHitResolver {
  MapHitState get state;
  set state(MapHitState value);

  MapEvent? onPointerDown(MapHit hit, Point point) {
    switch (hit) {
      case CursorHit():
        state = CursorPressed(point);
        return null;
      case _:
        return null;
    }
  }

  MapEvent? onPointerMove(MapHit hit, Point point, LatLng latLng) {
    switch (state) {
      case CursorPressed(:final downPoint):
        if (point.squaredDistanceTo(downPoint) > 4) {
          state = CursorDragged();
          return CursorDraggedStart(latLng);
        }
        return null;
      case CursorDragged():
        return CursorDragUpdate(latLng);
      case _:
        return null;
    }
  }

  MapEvent? onPointerUp(MapHit hit, Point point, LatLng latLng) {
    final lastState = state;
    state = EmptyState(); // Essentielle pour remettre à zero
    switch (lastState) {
      case CursorDragged():
        return CursorDraggedEnd(latLng);
      case CursorPressed():
        return CursorTapped(latLng);
      case _:
        return null;
    }
  }
}
