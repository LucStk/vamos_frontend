import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/map_ui_element.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/markers/marker_ui_element.dart';

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
