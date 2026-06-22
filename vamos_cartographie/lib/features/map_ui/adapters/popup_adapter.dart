import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/models/map_ui_element.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/models/markers/marker_ui_element.dart';

extension PopupAdapter on MapUiElement {
  Widget buildPopup(Id<Trip> tripId) {
    return switch (this) {
      WaypointUiElement w => Row(children: []),
      VertexUiElement v => Row(children: []),
      CursorUiElement c => Row(children: []),
      MapUiElement _ => SizedBox.shrink(),
    };
  }
}
