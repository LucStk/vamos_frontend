// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../camera/injection/camera_director_provider.dart';
import '../layers/map_tile_layer.dart';
import '../overlay_ui/popup_overlay.dart';
import '../overlay_ui/right_control_panel.dart';
import 'map_gesture_bridge.dart';

@Dependencies([cameraDirector])
class BaseMap extends ConsumerWidget {
  const BaseMap({
    super.key,
    required this.overlayChildren,
    this.cameraTriggers = const [],
  });

  final List<ProviderListenable<void>> cameraTriggers;
  final List<Widget> overlayChildren;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cameraDirectorProvider);

    for (final trigger in cameraTriggers) {
      ref.watch(trigger);
    }

    return Stack(
      children: [
        MapGestureBridge(mapLayers: [MapTileLayer()]),
        const MapControls(),
        const PopupOverlay(),
        ...overlayChildren,
      ],
    );
  }
}
