// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

import '../canvas/injection/visual_target.dart';

import '/map/camera/injection/camera_director_provider.dart';
import '/map/camera/injection/map_camera_provider.dart';

import '/map/camera/injection/camera_or_null.dart';
import '/map/layers/map_tile_layer.dart';
import '/map/overlay_ui/right_control_panel.dart';

import '../injection/map_gesture_handler.dart';

import '/map/injection/map_scene.dart';
import 'map_gesture_bridge.dart';

@Dependencies([
  visualTargets,
  CameraOrNull,
  mapScene,
  cameraDirector,
  mapCamera,
  MapGestureHandlerNotifier,
])
class BaseMap extends ConsumerWidget {
  const BaseMap({super.key, required this.overlayChildren});

  final List<Widget> overlayChildren;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cameraDirectorProvider);

    return Stack(
      children: [
        MapGestureBridge(mapLayers: [MapTileLayer()]),
        const MapControls(),
        ...overlayChildren,
      ],
    );
  }
}
