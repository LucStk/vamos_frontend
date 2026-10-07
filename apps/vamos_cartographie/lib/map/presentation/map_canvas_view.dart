import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

import '../camera/application/map_scene_paint.dart';
import '../camera/injection/camera_or_null.dart';
import '../camera/injection/map_camera_provider.dart';
import '../injection/map_gesture_handler.dart';
import '/map/injection/map_scene.dart';

@Dependencies([CameraOrNull, mapCamera, mapScene, MapGestureHandlerNotifier])
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
        onMapReady: () =>
            ref.read(cameraOrNullProvider.notifier).markReady(camera),
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
      children: [
        ...layers,
        ProviderScope(
          overrides: [
            mapCameraSnapshotProvider.overrideWith(mapCameraSnapshot),
          ],
          child: MapScenePaint(),
        ),
      ],
    );
  }
}
