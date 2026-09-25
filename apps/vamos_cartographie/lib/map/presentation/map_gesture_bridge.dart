// features/map/presentation/widgets/map_gesture_bridge.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:vamos_cartographie/map/map.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

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

@Dependencies([
  mapController,
  mapGestureHandler,
  mapContext,
  MapCameraChanges,
  mapCameraSnapshot,
])
class MapGestureBridge extends ConsumerStatefulWidget {
  final List<Widget> mapLayers;

  const MapGestureBridge({required this.mapLayers, super.key});

  @override
  ConsumerState<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends ConsumerState<MapGestureBridge> {
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  @override
  void dispose() {
    _panAllowed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapContext = ref.read(mapContextProvider);
    final controller = ref.watch(mapControllerProvider);
    final gestureHandler = ref.read(mapGestureHandlerProvider(controller));
    void resolve(PointerEventType type, PointerEvent event) {
      final offset = mapContext.camera.screenToWorld(
        ScreenOffset(event.localPosition),
      );

      gestureHandler.resolve(type, offset);

      _panAllowed.value = gestureHandler.panAllowed;
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => resolve(PointerEventType.down, event),
      onPointerMove: (event) => resolve(PointerEventType.move, event),
      onPointerUp: (event) => resolve(PointerEventType.up, event),
      child: PanLock(
        notifier: _panAllowed,
        child: MapCanvas(layers: widget.mapLayers),
      ),
    );
  }
}
