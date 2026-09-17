// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_screen.dart';
import 'package:map_engine/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/base_map/injection/map_camera_provider.dart';
import 'package:vamos_cartographie/base_map/layers/layers.dart';
import 'package:vamos_cartographie/base_map/overlay_ui/right_control_panel.dart';

class BaseMap extends ConsumerStatefulWidget {
  const BaseMap({
    super.key,
    required this.actionResolver,
    required this.sceneProvider,
    required this.sceneReader,
  });

  final GestureActionResolver actionResolver;
  final GestureSceneReader sceneReader;
  final ProviderListenable<MapScene> sceneProvider;

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
          .read(mapCameraControllerHolderProvider.notifier)
          .set(FlutterMapCameraController(_animatedMapController));
    });
  }

  @override
  void dispose() {
    // Évite que le provider conserve une référence vers un contrôleur
    // qui vient d'être détruit.
    ref.read(mapCameraControllerHolderProvider.notifier).clear();
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapScreen(
            actionResolver: widget.actionResolver,
            mapCameraReader: ref.read(mapCameraReaderProvider),
            mapController: ref.read(mapControllerProvider),
            sceneReader: widget.sceneReader,
            sceneProvider: widget.sceneProvider,
            layers: const [MapTileLayer()],
          ),
          const MapControls(),
        ],
      ),
    );
  }
}
