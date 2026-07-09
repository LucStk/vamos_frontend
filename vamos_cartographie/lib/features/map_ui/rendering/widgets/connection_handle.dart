// map_ui/rendering/widgets/connection_handle.dart

import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/rendering.dart';

import 'package:vamos_cartographie/core/injection/injection.dart';

class ConnectionHandle extends StatelessWidget {
  final MapStateNotifier mapStateNotifier;
  final ConnectionHandleType type;
  final double size;
  final VertexUiElement element;

  const ConnectionHandle({
    super.key,
    required this.type,
    required this.mapStateNotifier,
    required this.element,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: (details) => mapStateNotifier.sendUiEvent(
        element.connectionDragStartEvent(type, details.globalPosition),
      ),
      onPanUpdate: (details) => mapStateNotifier.sendUiEvent(
        element.connectionDragUpdateEvent(type, details.globalPosition),
      ),
      onPanEnd: (_) => mapStateNotifier.sendUiEvent(
        element.connectionDragEndEvent(ConnectionHandleType.incoming),
      ),
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
