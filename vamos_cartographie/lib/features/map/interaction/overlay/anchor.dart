library anchor;

import 'package:flutter/animation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
part "anchor_types.dart";

sealed class OverlayAnchor {
  const OverlayAnchor();
}
