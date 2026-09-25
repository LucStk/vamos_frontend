// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/map_application.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/layers/layers.dart';
import 'package:vamos_cartographie/map/overlay_ui/right_control_panel.dart';
import 'package:vamos_cartographie/map/presentation/presentation.dart';

@Dependencies([cameraDirector, mapController, MapCameraHolder])
class BaseMap extends ConsumerWidget {
  const BaseMap({
    super.key,
    required this.controllerProvider,
    required this.sceneProvider,
    required this.overlayChildren,
    this.cameraTriggers = const [],
  });

  final ProviderListenable<BaseController> controllerProvider;
  final ProviderListenable<MapScene> sceneProvider;
  final List<ProviderListenable<void>> cameraTriggers;
  final List<Widget> overlayChildren;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cameraDirectorProvider);
    for (final trigger in cameraTriggers) {
      ref.watch(trigger);
    }
    return Scaffold(
      body: Stack(
        children: [
          // MapGestureBridge(
          //   controller: controllerProvider,
          //   sceneProvider: sceneProvider,
          //   mapLayers: [MapTileLayer()],
          // ),
          // const MapControls(),
          ...overlayChildren,
        ],
      ),
    );
  }
}
