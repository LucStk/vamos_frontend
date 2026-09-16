// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/misc.dart';

class MapScreen extends StatefulWidget {
  final MapCameraReader mapCameraReader;
  final MapController mapController;
  final GestureActionResolver actionResolver;
  final GestureSceneReader sceneReader;
  final ProviderListenable<MapScene> sceneProvider;
  final List<Widget> layers;
  final ValueChanged<MapCameraController>? onCameraControllerReady;

  const MapScreen({
    super.key,
    required this.mapCameraReader,
    required this.mapController,
    required this.actionResolver,
    required this.sceneReader,
    required this.sceneProvider,
    this.layers = const [],
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
      mapCameraReader: widget.mapCameraReader,
      child: MapCanvas(
        mapController: widget.mapController,
        panAllowed: _panAllowed,
        onCameraControllerReady: widget.onCameraControllerReady,
        sceneProvider: widget.sceneProvider,
        layers: widget.layers,
      ),
    );
  }
}
