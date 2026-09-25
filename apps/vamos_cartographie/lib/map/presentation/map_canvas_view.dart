import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/map/map.dart';
import "map_scene_painter.dart";

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([mapScene, mapCamera, MapCameraChanges, mapCameraSnapshot])
class MapCanvas extends ConsumerWidget {
  final List<Widget> layers;

  const MapCanvas({super.key, this.layers = const []});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = ref.watch(mapCameraProvider);
    final panAllowed = PanLock.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: panAllowed,
      builder: (context, panAllowed, _) {
        return FlutterMap(
          mapController: camera.mapController,
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
          children: [...layers, MapScenePaint()],
        );
      },
    );
  }
}
