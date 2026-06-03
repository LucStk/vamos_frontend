import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';

import "package:vamos_cartographie/features/segments/segments.dart";

class IntermediatePoints extends DragMarker {
  IntermediatePoints({
    required LatLng point,
    required GSegmentTypeEnum segmentType,
    required bool isGhost,
    required void Function(dynamic, LatLng) onDragStartCallback,
    required void Function(dynamic, LatLng) onDragUpdateCallback,
    required void Function(dynamic, LatLng) onDragEndCallback,
    void Function(dynamic)? onLongPressCallback,
    void Function(dynamic)? onTapCallback,
  }) : super(
         point: point,
         size: isGhost ? const Size(18, 18) : const Size(24, 24),
         builder: (_, __, isDragging) {},
         // _buildIcon(segmentType, isDragging, isGhost),
         onDragStart: onDragStartCallback,
         onDragUpdate: onDragUpdateCallback,
         onDragEnd: onDragEndCallback,
         onLongPress: onLongPressCallback,
         onTap: onTapCallback,
       );
}
