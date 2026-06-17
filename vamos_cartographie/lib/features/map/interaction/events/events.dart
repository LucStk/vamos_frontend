library map_events;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/features.dart';

part 'map_events.dart';
part 'marker_events.dart';
part 'segment_events.dart';
part 'drag_events.dart';

sealed class MapInteractionEvent {
  const MapInteractionEvent();
}

// /// POPUP
// class PopUpRequested extends MapInteractionEvent {
//   final LatLng position;
//   final AbstractPopUp popUp;

//   const PopUpRequested({required this.position, required this.popUp});
// }

// class PopUpClosed extends MapInteractionEvent {
//   const PopUpClosed();
// }
