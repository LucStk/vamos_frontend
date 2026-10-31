import 'package:flutter/gestures.dart' hide PointerEvent;
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/interaction/hit_test_engine.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:domain_core/domain_core.dart';
part 'map_gesture_handler.g.dart';

/// State : `true` tant que la carte peut être pannée
/// (`false` pendant le drag d'un objet).
@Riverpod(keepAlive: true, dependencies: [hitTester])
class MapGestureHandlerNotifier extends _$MapGestureHandlerNotifier
    implements MapGestureHost {
  late MapGestureHandler _handler;

  @override
  bool build() {
    _handler = MapGestureHandler(host: this);
    ref.onDispose(_handler.dispose);
    return true;
  }

  @override
  GestureSink get sink => ref.read(appModeMachineProvider.notifier);

  @override
  HitObject? hitTest({
    required ScreenOffset offset,
    MapObject? exclude,
    bool dropTargetsOnly = false,
  }) => ref
      .read(hitTesterProvider)
      .hitTest(
        offset: offset,
        exclude: exclude,
        dropTargetsOnly: dropTargetsOnly,
      );
  @override
  void onPanAllowedChanged(bool allowed) => state = allowed;
  // --- Entrées Flutter -> événements du moteur -----------------------------

  void onPointerDown(PointerDownEvent e) => _handler.onPointerEvent(
    PointerDown(_position(e.localPosition), _buttonOf(e.kind, e.buttons)),
  );

  void onPointerMove(PointerMoveEvent e) =>
      _handler.onPointerEvent(PointerMove(_position(e.localPosition)));

  void onPointerUp(PointerUpEvent e) =>
      _handler.onPointerEvent(PointerUp(_position(e.localPosition)));

  void onPointerCancel(PointerCancelEvent e) =>
      _handler.onPointerEvent(PointerCancel(_position(e.localPosition)));

  // --- Interne -------------------------------------------------------------

  /// La caméra est lue à chaque événement, jamais capturée.
  PointerPosition _position(Offset local) {
    final screen = ScreenOffset(local);
    final camera = ref.read(mapCameraProvider);
    return PointerPosition(screen: screen, world: camera.screenToWorld(screen));
  }

  /// Sur un `up`, Flutter met `buttons` à 0 : on retombe sur `primary`,
  /// ce que le handler ignore de toute façon (il suit lui-même le clic droit).
  static PointerButton _buttonOf(PointerDeviceKind kind, int buttons) =>
      kind == PointerDeviceKind.mouse && (buttons & kSecondaryMouseButton) != 0
      ? PointerButton.secondary
      : PointerButton.primary;
}
