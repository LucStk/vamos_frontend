import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/markers/marker_ui_element.dart';

Marker toMarker(MarkerUiElement element, Id<Trip> tripId, MapCtrl ctrl) {
  return Marker(
    point: element.latLng,

    child: GestureDetector(
      onTap: () => ctrl.onUiEvent(element.tapEvent()),
      onDoubleTap: () => ctrl.onUiEvent(element.tapEvent()),
      child: element.buildMarker(),
    ),
  );
}
