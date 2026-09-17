import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_engine.dart';
import '/map_canvas.dart';

class MapCanvas extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: panAllowed,
      builder: (context, panAllowed, _) {
        return FlutterMap(
          mapController: mapController,
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
            ...layers,
            // TestLayer(),
            MapScenePaint(sceneProvider: sceneProvider),
          ],
        );
      },
    );
  }
}
