// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map_canvas/gesture_resolver_type.dart';
import 'package:vamos_cartographie/map_canvas/injections/map_camera_provider.dart';
import 'package:vamos_cartographie/map_canvas/map_canvas_view.dart';
import 'package:vamos_cartographie/map_canvas/map_gesture_bridge.dart';

class MapScreen extends ConsumerStatefulWidget {
  final GestureActionResolver actionResolver;
  final GestureSceneReader sceneReader;
  final ProviderListenable<CustomPainter> painterProvider;

  const MapScreen({
    super.key,
    required this.actionResolver,
    required this.sceneReader,
    required this.painterProvider,
  });

  @override
  ConsumerState<MapScreen> createState() => _MapEditorScreenState();
}

class _MapEditorScreenState extends ConsumerState<MapScreen> {
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
        mapController: ref.read(mapControllerProvider),
        panAllowed: _panAllowed,
        painterProvider: widget.painterProvider,
      ),
    );
  }
}
