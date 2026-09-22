// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_engine/map_engine.dart';

class MapScreen extends ConsumerStatefulWidget {
  final MapCameraReader mapCameraReader;
  final MapController mapController;
  final OnGesture onGesture;
  final Widget mapScenePaint;
  final HitTest hitTest;
  final List<Widget> layers;

  const MapScreen({
    super.key,
    required this.hitTest,
    required this.mapCameraReader,
    required this.mapController,
    required this.onGesture,
    required this.mapScenePaint,
    this.layers = const [],
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

  @override
  Widget build(BuildContext context) {
    return MapGestureBridge(
      onGesture: widget.onGesture,
      hitTest: widget.hitTest,
      panAllowed: _panAllowed,
      mapCameraReader: widget.mapCameraReader,
      child: MapCanvas(
        mapController: widget.mapController,
        panAllowed: _panAllowed,
        mapScenePaint: widget.mapScenePaint,
        layers: widget.layers,
      ),
    );
  }
}
