// features/map/presentation/widgets/map_gesture_bridge.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/engine/injection/injection.dart';

/// Expose l'état "pan autorisé ou non" aux descendants sans obliger
/// chaque widget intermédiaire à le recevoir en paramètre de constructeur.
class PanLock extends InheritedNotifier<ValueNotifier<bool>> {
  const PanLock({
    super.key,
    required ValueNotifier<bool> notifier,
    required super.child,
  }) : super(notifier: notifier);

  static ValueListenable<bool> of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<PanLock>();
    assert(
      widget != null,
      'PanLock.of() appelé en dehors d\'un MapGestureBridge',
    );
    return widget!.notifier!;
  }
}

class MapGestureBridge extends ConsumerStatefulWidget {
  MapGestureBridge({required OnGesture onGesture, super.key})
    : gestureHandler = MapGestureHandler(
        hitTest: hitTest,
        onGesture: onGesture,
      );

  final MapGestureHandler gestureHandler;

  @override
  ConsumerState<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends ConsumerState<MapGestureBridge> {
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  void _resolve(PointerEventType type, PointerEvent event) {
    final offset = ref
        .read(mapCameraHolderProvider)
        .screenToWorld(ScreenOffset(event.localPosition));
    widget.gestureHandler.resolve(type, offset);
    _panAllowed.value = widget.gestureHandler.panAllowed;
  }

  @override
  void dispose() {
    widget.gestureHandler.dispose();
    _panAllowed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => _resolve(PointerEventType.down, event),
      onPointerMove: (event) => _resolve(PointerEventType.move, event),
      onPointerUp: (event) => _resolve(PointerEventType.up, event),
      child: PanLock(notifier: _panAllowed, child: widget.child),
    );
  }
}
