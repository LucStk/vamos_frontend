import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/domain/types/Ids.dart';

import 'package:vamos_cartographie/features/map_editor/map_editor.dart';

abstract class MarkerUiElement {
  final TripId tripId;
  const MarkerUiElement(this.tripId);
  LatLng get latLng;

  Widget buildMarker({bool isDragging = false});

  MapUiEvent tapEvent();
  MapUiEvent doubleTapEvent();
}
