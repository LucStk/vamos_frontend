import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';

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
         builder: (_, __, isDragging) =>
             _buildIcon(segmentType, isDragging, isGhost),
         onDragStart: onDragStartCallback,
         onDragUpdate: onDragUpdateCallback,
         onDragEnd: onDragEndCallback,
         onLongPress: onLongPressCallback,
         onTap: onTapCallback,
       );

  static Widget _buildIcon(
    GSegmentTypeEnum type,
    bool isDragging,
    bool isGhost,
  ) {
    if (isGhost && !isDragging) {
      // Icône fantôme
      return Container(
        decoration: BoxDecoration(
          color: type.color.withOpacity(0.3),
          shape: BoxShape.circle,
          border: Border.all(color: type.color.withOpacity(0.6), width: 1),
        ),
      );
    } else {
      // Icône intermédiaire normale ou fantôme en cours de drag
      return Container(
        decoration: BoxDecoration(
          color: isDragging ? type.color : type.color.withOpacity(0.7),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Icon(Icons.circle, color: Colors.white, size: 10),
      );
    }
  }
}
