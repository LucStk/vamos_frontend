import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:flutter/material.dart';
import '/map/rendering/elements/vertex_element.dart';

import 'package:vamos_cartographie/core/injection/injection.dart';

DragMarker toVertexMarker(
  VertexElement element,
  Id<Trip> tripId,
  MapStateNotifier mapStateNotifier,
) {
  const totalSize = 30.0;
  return DragMarker(
    point: element.latLng,
    size: const Size(totalSize, totalSize),

    // Déplacer le point nécessite désormais un appui long avant le drag,
    // ce qui libère le pan immédiat pour nos poignées de connexion.
    // useLongPress: true,
    builder: (context, LatLng latLng, isDragging) {
      return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // --- Marqueur principal : tap = dialog, long-press+drag = déplacement ---
          GestureDetector(
            onTap: () => mapStateNotifier.sendUiEvent(element.tapEvent()),
            // onDoubleTap: () => mapStateNotifier.sendUiEvent(element.tapEvent()),
            child: element.buildMarker(isDragging: isDragging),
          ),

          // Positioned(
          //   left: -handleSize * 0.6,
          //   child: ConnectionHandle(
          //     type: ConnectionHandleType.incoming,
          //     element: element,
          //     mapStateNotifier: mapStateNotifier,
          //     size: handleSize,
          //   ),
          // ),

          // Positioned(
          //   right: -handleSize * 0.6,
          //   child: ConnectionHandle(
          //     type: ConnectionHandleType.outgoing,
          //     element: element,
          //     mapStateNotifier: mapStateNotifier,
          //     size: handleSize,
          //   ),
          // ),
        ],
      );
    },
    onDragStart: (_, LatLng latLng) =>
        mapStateNotifier.sendUiEvent(element.dragStartEvent(latLng)),
    onDragEnd: (_, LatLng latLng) =>
        mapStateNotifier.sendUiEvent(element.dragEndEvent(latLng)),
  );
}
