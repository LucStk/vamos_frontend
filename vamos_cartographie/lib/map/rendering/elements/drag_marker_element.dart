import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import '/map/rendering/elements/marker_element.dart';

abstract class DragMarkerElement extends MarkerElement {
  const DragMarkerElement(super.tripId);

  @override
  Widget buildMarker({bool isDragging = false});

  MapInputEvent dragStartEvent(LatLng latng);
  MapInputEvent dragEndEvent(LatLng latlng);
}
