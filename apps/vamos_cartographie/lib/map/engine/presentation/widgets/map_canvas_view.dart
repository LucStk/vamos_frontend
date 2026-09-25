import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/engine/engine.dart';

@Dependencies([mapController, MapCameraChanges, mapCameraSnapshot])
class MapCanvas extends ConsumerWidget {
  final ProviderListenable<MapScene> sceneProvider;
  final List<Widget> layers;

  const MapCanvas({
    super.key,
    required this.sceneProvider,
    this.layers = const [],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final panAllowed = PanLock.of(context);
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
            MapScenePaint(sceneProvider: sceneProvider),
          ],
        );
      },
    );
  }
}
