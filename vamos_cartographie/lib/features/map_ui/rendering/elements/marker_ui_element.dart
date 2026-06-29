import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/events/ui_events.dart';
import 'package:trip_domain/domain/types/Ids.dart';

abstract class MarkerUiElement {
  final TripId tripId;
  const MarkerUiElement(this.tripId);
  LatLng get latLng;

  Widget buildMarker({bool isDragging = false});

  MapUiEvent tapEvent();
  MapUiEvent doubleTapEvent();
}
