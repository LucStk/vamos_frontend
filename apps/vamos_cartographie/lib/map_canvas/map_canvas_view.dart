import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map_canvas/flutter_map_camera_controller.dart';
import 'package:vamos_cartographie/map_canvas/injections/map_camera_provider.dart';
import 'package:vamos_cartographie/map_canvas/layers/map_tile_layer.dart';
import 'package:vamos_cartographie/map_canvas/layers/network_overlay_layer.dart';
import 'package:vamos_cartographie/map_canvas/overlay_ui/right_control_panel.dart';

class MapCanvas extends ConsumerStatefulWidget {
  final MapController mapController;
  final ValueListenable<bool> panAllowed;
  final ProviderListenable<CustomPainter> painterProvider;

  const MapCanvas({
    super.key,
    required this.mapController,
    required this.panAllowed,
    required this.painterProvider,
  });

  @override
  ConsumerState<MapCanvas> createState() => _MapCanvasState();
}

class _MapCanvasState extends ConsumerState<MapCanvas>
    with TickerProviderStateMixin {
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
      ref
          .read(mapCameraControllerHolderProvider.notifier)
          .set(FlutterMapCameraController(_animatedMapController));
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
      builder: (context, panAllowed, _) => FlutterMap(
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
          const MapTileLayer(),
          const NetworkOverlayLayer(),
          const MapControls(),
          Consumer(
            builder: (context, ref, _) {
              final painter = ref.watch(widget.painterProvider);
              return CustomPaint(painter: painter);
            },
          ),
        ],
      ),
    );
  }
}
