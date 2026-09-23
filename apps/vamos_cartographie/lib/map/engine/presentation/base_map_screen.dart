// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/map_application.dart';
import 'package:map_canvas/map_canvas.dart';
import 'map_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class BaseMap extends ConsumerStatefulWidget {
  const BaseMap({
    super.key,
    required this.controller,
    required this.sceneProvider,
    required this.overlayChildren,
  });

  final BaseController controller;
  final ProviderListenable<MapScene> sceneProvider;
  final List<Widget> overlayChildren;

  @override
  ConsumerState<BaseMap> createState() => _BaseMapState();
}

class _BaseMapState extends ConsumerState<BaseMap>
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
  }

  @override
  void dispose() {
    // Évite que le provider conserve une référence vers un contrôleur
    // qui vient d'être détruit.
    ref.read(mapCameraHolderProvider.notifier).detachAnimatedController();
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapScreen(
            onGesture: widget.controller.dispatchGesture,
            mapCameraReader: ref.read(mapCameraHolderProvider),
            mapController: ref.read(mapControllerProvider),
            hitTest: ref.read(mapHitTestProvider(widget.sceneProvider)),
            mapScenePaint: MapScenePaint(
              sceneProvider: widget.sceneProvider,
              mapCameraReader: ref.read(mapCameraHolderProvider),
            ),

            layers: const [MapTileLayer()],
          ),
          const MapControls(),
          ...widget.overlayChildren,
        ],
      ),
    );
  }
}
