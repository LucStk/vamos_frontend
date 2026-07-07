import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/marker_ui_element.dart';

abstract class DragMarkerUiElement extends MarkerUiElement {
  const DragMarkerUiElement(super.tripId);

  @override
  Widget buildMarker({bool isDragging = false});

  MapInputEvent dragStartEvent(LatLng latng);
  MapInputEvent dragEndEvent(LatLng latlng);
}
