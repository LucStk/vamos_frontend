import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/injection/map_state_provider.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex_ui_element.dart';

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
    useLongPress: true,
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
            child: _ConnectionHandle(
              type: ConnectionHandleType.incoming,
              size: handleSize,
              onPanStart: (details) => mapStateNotifier.sendUiEvent(
                element.connectionDragStartEvent(
                  ConnectionHandleType.incoming,
                  details.globalPosition,
                ),
              ),
              onPanUpdate: (details) => mapStateNotifier.sendUiEvent(
                element.connectionDragUpdateEvent(
                  ConnectionHandleType.incoming,
                  details.globalPosition,
                ),
              ),
              onPanEnd: (_) => mapStateNotifier.sendUiEvent(
                element.connectionDragEndEvent(ConnectionHandleType.incoming),
              ),
            ),
          ),

          Positioned(
            right: -handleSize * 0.6,
            child: _ConnectionHandle(
              type: ConnectionHandleType.outgoing,
              size: handleSize,
              onPanStart: (details) => mapStateNotifier.sendUiEvent(
                element.connectionDragStartEvent(
                  ConnectionHandleType.outgoing,
                  details.globalPosition,
                ),
              ),
              onPanUpdate: (details) => mapStateNotifier.sendUiEvent(
                element.connectionDragUpdateEvent(
                  ConnectionHandleType.outgoing,
                  details.globalPosition,
                ),
              ),
              onPanEnd: (_) => mapStateNotifier.sendUiEvent(
                element.connectionDragEndEvent(ConnectionHandleType.outgoing),
              ),
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

class _ConnectionHandle extends StatelessWidget {
  const _ConnectionHandle({
    required this.type,
    required this.size,
    required this.onPanStart,
    required this.onPanUpdate,
    required this.onPanEnd,
  });

  final ConnectionHandleType type;
  final double size;
  final GestureDragStartCallback onPanStart;
  final GestureDragUpdateCallback onPanUpdate;
  final GestureDragEndCallback onPanEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      // Zone tactile plus large (~44px) que le rendu visuel
      child: SizedBox(
        width: size * 2,
        height: size * 2,
        child: Center(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: type == ConnectionHandleType.incoming
                    ? Colors.blue
                    : Colors.green,
                width: 2,
              ),
            ),
            child: Icon(
              type == ConnectionHandleType.incoming
                  ? Icons.arrow_back
                  : Icons.arrow_forward,
              size: size * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
