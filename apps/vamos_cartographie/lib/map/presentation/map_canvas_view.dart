import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/map/map.dart';
import "map_scene_painter.dart";

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([mapScene, CameraOrNull, mapCamera, mapCameraSnapshot])
class MapCanvas extends ConsumerWidget {
  final List<Widget> layers;
  final ValueListenable<bool> panAllowed;

  const MapCanvas({
    super.key,
    this.layers = const [],
    required this.panAllowed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = ref.watch(mapCameraProvider);
    return ValueListenableBuilder<bool>(
      valueListenable: panAllowed,
      builder: (context, allowed, _) {
        return FlutterMap(
          mapController: camera.mapController,
          options: MapOptions(
            onMapReady: () =>
                ref.read(cameraOrNullProvider.notifier).markReady(camera),
            initialCenter: const LatLng(46.8, 2.2),
            initialZoom: 7,
            interactionOptions: InteractionOptions(
              flags: allowed
                  ? InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom
                  : InteractiveFlag.all &
                        ~InteractiveFlag.doubleTapZoom &
                        ~InteractiveFlag.drag,
            ),
          ),
          children: [...layers, MapScenePaint()],
        );
      },
    );
  }
}
