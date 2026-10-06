import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

import '../camera/application/map_scene_paint.dart';
import '../camera/injection/camera_or_null.dart';
import '../camera/injection/map_camera_provider.dart';

// Ne fonctionne pas avec la version riverpod aujourd'hui
// @Dependencies([])
// class CameraSnapshotScope extends StatelessWidget {
//   const CameraSnapshotScope({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return ProviderScope(
//       overrides: [mapCameraSnapshotProvider.overrideWith(mapCameraSnapshot)],
//       child: child,
//     );
//   }
// }

@Dependencies([CameraOrNull, mapCamera])
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
            initialCameraFit:
                camera.initialCameraFit, // null → fallback ci-dessous
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

          children: [
            ...layers,
            ProviderScope(
              overrides: [
                mapCameraSnapshotProvider.overrideWith(mapCameraSnapshot),
              ],
              child: MapScenePaint(),
            ),
            // CameraSnapshotScope(child: MapScenePaint()),
          ],
        );
      },
    );
  }
}
