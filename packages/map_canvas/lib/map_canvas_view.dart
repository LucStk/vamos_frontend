import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_camera_controller.dart';
import '/map_canvas.dart';

class MapCanvas extends StatefulWidget {
  final MapController mapController;
  final ValueListenable<bool> panAllowed;
  final ProviderListenable<MapScene> sceneProvider;
  final ValueChanged<MapCameraController>? onCameraControllerReady;
  final List<Widget> layers;

  const MapCanvas({
    super.key,
    required this.mapController,
    required this.panAllowed,
    required this.sceneProvider,
    this.layers = const [],
    this.onCameraControllerReady,
  });

  @override
  State<MapCanvas> createState() => _MapCanvasState();
}

class _MapCanvasState extends State<MapCanvas> with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController;

  @override
  void initState() {
    super.initState();

    _animatedMapController = AnimatedMapController(
      vsync: this,
      mapController: widget.mapController,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      widget.onCameraControllerReady?.call(
        FlutterMapCameraController(_animatedMapController),
      );
    });
  }

  @override
  void dispose() {
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.panAllowed,
      builder: (context, panAllowed, _) {
        return FlutterMap(
          mapController: widget.mapController,
          options: MapOptions(
            initialCenter: const LatLng(46.8, 2.2),
            initialZoom: 7,
            interactionOptions: InteractionOptions(
              flags: panAllowed
                  ? InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom
                  : InteractiveFlag.all &
                        ~InteractiveFlag.doubleTapZoom &
                        ~InteractiveFlag.drag,
            ),
          ),
          children: [
            ...widget.layers,
            MapScenePaint(sceneProvider: widget.sceneProvider),
          ],
        );
      },
    );
  }
}
