import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/interaction/map_gesture_handler.dart';
import 'package:vamos_cartographie/map/rendering/map_scene_paint.dart';
import 'package:vamos_cartographie/map/scene/map_scene.dart';
import 'package:vamos_cartographie/map/interaction/visual_target.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';

@Dependencies([visualTargets, mapScene, mapMode, MapGestureHandlerNotifier])
class MapCanvas extends ConsumerWidget {
  final List<Widget> layers;

  const MapCanvas({super.key, this.layers = const []});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = ref.watch(mapCameraProvider);
    final panAllowed = ref.watch(mapGestureHandlerProvider);

    return FlutterMap(
      mapController: camera.mapController,
      options: MapOptions(
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
      ),
      children: [...layers, MapScenePaint()],
    );
  }
}
