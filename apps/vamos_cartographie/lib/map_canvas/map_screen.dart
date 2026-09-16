// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:map_engine/map_camera_controller.dart';
import 'package:vamos_cartographie/map_canvas/gesture_resolver_type.dart';
import 'package:vamos_cartographie/map_canvas/map_canvas_view.dart';
import 'package:vamos_cartographie/map_canvas/map_gesture_bridge.dart';

import 'package:flutter_map/flutter_map.dart';

class MapScreen extends StatefulWidget {
  final MapController mapController;
  final GestureActionResolver actionResolver;
  final GestureSceneReader sceneReader;
  final Widget child;
  final ValueChanged<MapCameraController>? onCameraControllerReady;

  const MapScreen({
    super.key,
    required this.mapController,
    required this.actionResolver,
    required this.sceneReader,
    required this.child,
    this.onCameraControllerReady,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  @override
  void dispose() {
    _panAllowed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MapGestureBridge(
      sceneReader: widget.sceneReader,
      actionResolver: widget.actionResolver,
      panAllowed: _panAllowed,
      child: MapCanvas(
        mapController: widget.mapController,
        panAllowed: _panAllowed,
        onCameraControllerReady: widget.onCameraControllerReady,
        child: widget.child,
      ),
    );
  }
}
