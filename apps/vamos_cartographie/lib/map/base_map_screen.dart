// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/injection/map_camera_provider.dart';
import 'package:vamos_cartographie/map/layers/layers.dart';
import 'package:vamos_cartographie/map/overlay_ui/right_control_panel.dart';

class BaseMap extends ConsumerWidget {
  final GestureActionResolver actionResolver;
  final GestureSceneReader sceneReader;
  final ProviderListenable<MapScene> sceneProvider;
  const BaseMap({
    super.key,
    required this.actionResolver,
    required this.sceneProvider,
    required this.sceneReader,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          MapScreen(
            actionResolver: actionResolver,
            mapCameraReader: ref.read(mapCameraReaderProvider),
            mapController: ref.read(mapControllerProvider),
            sceneReader: sceneReader,
            sceneProvider: sceneProvider,
            layers: [MapTileLayer()],
          ),
          MapControls(),
        ],
      ),
    );
  }
}
