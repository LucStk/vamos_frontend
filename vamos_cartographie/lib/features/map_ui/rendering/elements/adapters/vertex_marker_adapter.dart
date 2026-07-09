import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/injection/map_state_provider.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex_ui_element.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/widgets/connection_handle.dart';

DragMarker toVertexMarker(
  VertexUiElement element,
  Id<Trip> tripId,
  MapStateNotifier mapStateNotifier,
) {
  const handleSize = 20.0;
  const totalSize = 26.0 + handleSize * 2; // marge pour loger les poignées

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
            onDoubleTap: () => mapStateNotifier.sendUiEvent(element.tapEvent()),
            child: element.buildMarker(isDragging: isDragging),
          ),

          Positioned(
            left: -handleSize * 0.6,
            child: ConnectionHandle(
              type: ConnectionHandleType.incoming,
              element: element,
              mapStateNotifier: mapStateNotifier,
              size: handleSize,
            ),
          ),

          Positioned(
            right: -handleSize * 0.6,
            child: ConnectionHandle(
              type: ConnectionHandleType.outgoing,
              element: element,
              mapStateNotifier: mapStateNotifier,
              size: handleSize,
            ),
          ),
        ],
      );
    },
    onDragStart: (_, LatLng latLng) =>
        mapStateNotifier.sendUiEvent(element.dragStartEvent(latLng)),
    onDragEnd: (_, LatLng latLng) =>
        mapStateNotifier.sendUiEvent(element.dragEndEvent(latLng)),
  );
}
