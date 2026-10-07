import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "map_mode.dart";
part 'popup_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapModeController])
class PopUpNotifier extends _$PopUpNotifier {
  /// `null` = aucun popup ouvert.
  @override
  ScreenOffset? build() {
    // Tout changement de mode ferme le popup.
    ref.listen(mapModeControllerProvider, (_, _) => close());
    return null;
  }

  void open(ScreenOffset position) => state = position;
  void close() => state = null;
}

// @Dependencies([popupWorldPosition, mapCameraSnapshot])
// final popupScreenPositionProvider = Provider<ScreenOffset?>(
//   dependencies: [popupWorldPositionProvider, mapCameraSnapshotProvider],
//   (ref) {
//     final world = ref.watch(popupWorldPositionProvider);
//     if (world == null) return null;
//
//     final cam = ref.watch(mapCameraSnapshotProvider);
//
//     final dx = (world.dx - cam.worldCenter.dx) * cam.zoomScale;
//     final dy = (world.dy - cam.worldCenter.dy) * cam.zoomScale;
//
//     final cos = math.cos(cam.rotationRad);
//     final sin = math.sin(cam.rotationRad);
//
//     return ScreenOffset(
//       Offset(
//         cam.screenCenter.dx + dx * cos - dy * sin,
//         cam.screenCenter.dy + dx * sin + dy * cos,
//       ),
//     );
//   },
// );
// @Riverpod(keepAlive: true, dependencies: [mapCamera, mapMode])
// WorldOffset? popupWorldPosition(Ref ref) {
//   final position = ref.watch(mapModeProvider).popUpPosition;
//   if (position == null) return null;
//
//   final camera = ref.read(mapCameraProvider);
//   return camera.screenToWorld(position);
// }
