// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/map_application.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/camera.dart';
import 'package:vamos_cartographie/map/layers/map_tile_layer.dart';
import 'package:vamos_cartographie/map/overlay_ui/right_control_panel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'map_gesture_bridge.dart';
import "map_scope.dart";

@Dependencies([
  mapController,
  MapCameraHolder,
  MapCameraChanges,
  mapCameraSnapshot,
  cameraDirector,
])
class BaseMap extends StatelessWidget {
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
  Widget build(BuildContext context) => MapScope(
    child: _BaseMapContent(
      controllerProvider: controllerProvider,
      sceneProvider: sceneProvider,
      cameraTriggers: cameraTriggers,
      overlayChildren: overlayChildren,
    ),
  );
}

@Dependencies([
  cameraDirector,
  mapController,
  MapCameraHolder,
  MapCameraChanges,
  mapCameraSnapshot,
])
class _BaseMapContent extends ConsumerStatefulWidget {
  const _BaseMapContent({
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
  ConsumerState<_BaseMapContent> createState() => _BaseMapState();
}

class _BaseMapState extends ConsumerState<_BaseMapContent>
    with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController;

  @override
  void initState() {
    super.initState();

    final mapController = ref.read(mapControllerProvider);

    _animatedMapController = AnimatedMapController(
      vsync: this,
      mapController: mapController,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      ref
          .read(mapCameraHolderProvider.notifier)
          .attachAnimatedController(_animatedMapController);
    });
    ref.listenManual(cameraDirectorProvider, (_, _) {});

    for (final trigger in widget.cameraTriggers) {
      ref.listenManual(trigger, (_, _) {});
    }
  }

  @override
  void dispose() {
    // Évite que le provider conserve une référence vers un contrôleur
    // qui vient d'être détruit.
    // ref.read(mapCameraHolderProvider.notifier).detachAnimatedController();
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapGestureBridge(
            controller: widget.controllerProvider,
            sceneProvider: widget.sceneProvider,
            mapLayers: [MapTileLayer()],
          ),
          const MapControls(),
          ...widget.overlayChildren,
        ],
      ),
    );
  }
}
