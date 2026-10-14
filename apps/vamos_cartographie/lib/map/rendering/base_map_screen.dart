// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/interaction/map_gesture_bridge.dart';

import 'package:vamos_cartographie/map/layers/map_tile_layer.dart';
import 'package:vamos_cartographie/map/overlay_ui/right_control_panel.dart';

@Dependencies([cameraDirector])
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
