import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../camera/injection/map_camera_provider.dart';
import 'map_mode.dart';
import 'map_scene.dart';
import 'popup_provider.dart';
part 'map_gesture_handler.g.dart';

/// State : `true` tant que la carte peut être pannée
/// (`false` pendant le drag d'un objet).
@Riverpod(
  keepAlive: true,
  dependencies: [mapScene, mapCamera, mapModeController, PopUpNotifier],
)
class MapGestureHandlerNotifier extends _$MapGestureHandlerNotifier {
  late final PointerGestureResolver _resolver = PointerGestureResolver(
    hitTest: _hitTest,
  );
  late final PendingTapTimer _tapTimer = PendingTapTimer(
    timeout: const Duration(milliseconds: 149),
    onTimeout: _onTapTimeout,
  );
  late final LongPressTimer _longPressTimer = LongPressTimer(
    timeout: const Duration(milliseconds: 500),
    onTimeout: (pressed) =>
        onPointerEvent(PointerEventType.longPressTimeout, pressed.offset),
  );

  @override
  bool build() {
    ref.onDispose(() {
      _tapTimer.dispose();
      _longPressTimer.dispose();
    });
    return true;
  }

  void _syncTimer() {
    switch (_resolver.state) {
      case final PendingTap pending:
        _longPressTimer.cancel();
        _tapTimer.update(pending);
      case final PressedState pressed:
        _tapTimer.cancel();
        _longPressTimer.update(pressed);
      case _:
        _tapTimer.cancel();
        _longPressTimer.cancel();
    }
  }

  void onSecondaryClick(ScreenOffset offset) {
    final element = _hitTest(offset: offset);
    final gesture = SecondaryTapGesture(offset, element: element);

    // D'abord le mode (qui peut changer et fermer le popup),
    // ensuite l'ouverture, sinon le popup se fermerait aussitôt.
    ref.read(mapModeControllerProvider).send(gesture, offset);
    ref.read(popUpProvider.notifier).open(offset);
  }

  void onPointerEvent(PointerEventType event, ScreenOffset offset) {
    // Un appui primaire ferme le popup, comme un clic en dehors d'un menu.
    if (event == PointerEventType.down) {
      ref.read(popUpProvider.notifier).close();
    }

    final gesture = _resolver.resolve(event, offset);
    _syncTimer();
    _syncPanAllowed();

    if (gesture == null) return;
    ref.read(mapModeControllerProvider).send(gesture, offset);
  }

  void _onTapTimeout(PendingTap pending) =>
      onPointerEvent(PointerEventType.tapTimeout, pending.offset);

  void _syncPanAllowed() {
    final allowed = switch (_resolver.state) {
      DraggingState(:final dragged) => dragged == null,
      _ => true,
    };
    if (allowed != state) state = allowed;
  }

  MapObject? _hitTest({required ScreenOffset offset, MapObject? exclude}) {
    final scene = ref.read(mapSceneProvider);
    final camera = ref.read(mapCameraProvider);
    return scene.hitTest(
      camera.screenToWorld(offset),
      camera.zoomScale,
      ignore: (o) => exclude != null && o.isSameAs(exclude),
    );
  }
}
