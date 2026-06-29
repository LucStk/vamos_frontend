import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/marker_ui_element.dart';

import 'package:vamos_cartographie/features/map_editor/map_editor.dart';

abstract class DragMarkerUiElement extends MarkerUiElement {
  const DragMarkerUiElement(super.tripId);

  @override
  Widget buildMarker({bool isDragging = false});

  MapUiEvent dragStartEvent(LatLng latng);
  MapUiEvent dragEndEvent(LatLng latlng);
}
