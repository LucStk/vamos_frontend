import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/map/interaction/overlay/anchor.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class OverlayPopupFactory {
  static Widget build(OverlayAnchor anchor, Id<Trip> tripId) {
    return switch (anchor) {
      CursorAnchor c => CursorPopUp(tripId: tripId, latLng: c.latLng),
      VertexAnchor v => VertexPopUp(tripId: tripId, vertexId: v.id),
      // ScreenAnchor s => GenericPopUp(tripId: tripId),
      WaypointAnchor w => WaypointPopUp(tripId: tripId, waypointId: w.id),
      _ => const SizedBox.shrink(),
    };
  }
}
