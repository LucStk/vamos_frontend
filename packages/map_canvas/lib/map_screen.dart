// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/misc.dart';

class MapScreen extends ConsumerStatefulWidget {
  final MapCameraReader mapCameraReader;
  final MapController mapController;
  final OnGesture onGesture;
  final GestureSceneReader sceneReader;
  final ProviderListenable<MapScene> sceneProvider;
  final List<Widget> layers;
  final ValueChanged<MapCameraController>? onCameraControllerReady;

  const MapScreen({
    super.key,
    required this.mapCameraReader,
    required this.mapController,
    required this.onGesture,
    required this.sceneReader,
    required this.sceneProvider,
    this.layers = const [],
    this.onCameraControllerReady,
  });

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  @override
  void dispose() {
    _panAllowed.dispose();
    super.dispose();
  }

  MapObject? _hitTest({required WorldOffset offset, MapObject? exclude}) {
    // ref.read lit la scène instantanée au moment de l'interaction
    // sans enregistrer de listener -> aucun rebuild du widget.
    final scene = ref.read(widget.sceneProvider);
    final scale = widget.mapCameraReader.getZoomScale();
    return scene.projectedScene.hitTest(offset, scale, exclude: exclude);
  }

  @override
  Widget build(BuildContext context) {
    return MapGestureBridge(
      onGesture: widget.onGesture,
      hitTest: _hitTest,
      panAllowed: _panAllowed,
      mapCameraReader: widget.mapCameraReader,
      child: MapCanvas(
        mapController: widget.mapController,
        panAllowed: _panAllowed,
        sceneProvider: widget.sceneProvider,
        layers: widget.layers,
      ),
    );
  }
}
