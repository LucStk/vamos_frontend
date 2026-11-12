import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/flutter_map_camera.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/map_gesture_handler.dart';
import 'package:vamos_cartographie/map/rendering/map_scene_paint.dart';

@Dependencies([MapGestureHandlerNotifier])
class MapCanvas extends ConsumerStatefulWidget {
  final List<Widget> layers;

  const MapCanvas({super.key, this.layers = const []});

  @override
  ConsumerState<MapCanvas> createState() => _MapCanvasState();
}

class _MapCanvasState extends ConsumerState<MapCanvas> {
  MapOptions? _options;
  FlutterMapCamera? _optionsCamera;
  bool? _optionsPanAllowed;

  /// Renvoie la MÊME instance tant que la caméra et panAllowed ne changent pas,
  /// pour que FlutterMap ne réapplique pas des options à chaque rebuild.
  MapOptions _optionsFor(FlutterMapCamera camera, bool panAllowed) {
    if (_options == null ||
        !identical(_optionsCamera, camera) ||
        _optionsPanAllowed != panAllowed) {
      _optionsCamera = camera;
      _optionsPanAllowed = panAllowed;
      _options = MapOptions(
        onMapReady: camera.markReady,
        initialCameraFit: camera.initialCameraFit,
        initialCenter: const LatLng(46.8, 2.2),
        initialZoom: 7,
        interactionOptions: InteractionOptions(
          flags: panAllowed
              ? InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom
              : InteractiveFlag.all &
                    ~InteractiveFlag.doubleTapZoom &
                    ~InteractiveFlag.drag,
        ),
      );
    }
    return _options!;
  }

  @override
  Widget build(BuildContext context) {
    final camera = ref.watch(mapCameraProvider);
    final panAllowed = ref.watch(mapGestureHandlerProvider);

    return FlutterMap(
      mapController: camera.mapController,
      options: _optionsFor(camera, panAllowed),
      children: [...widget.layers, MapScenePaint()],
    );
  }
}
