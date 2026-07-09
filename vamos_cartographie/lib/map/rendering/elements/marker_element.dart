import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_domain/domain/types/Ids.dart';

abstract class MarkerElement {
  final TripId tripId;
  const MarkerElement(this.tripId);
  LatLng get latLng;

  Widget buildMarker({bool isDragging = false});

  MapInputEvent tapEvent();
  MapInputEvent doubleTapEvent();
}
