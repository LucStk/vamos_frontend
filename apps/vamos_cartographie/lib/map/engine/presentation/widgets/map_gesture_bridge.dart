// features/map/presentation/widgets/map_gesture_bridge.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/base_controller_model.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/engine/engine.dart';
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
  MapCameraHolder,
  MapCameraChanges,
  mapCameraSnapshot,
])
class MapGestureBridge extends ConsumerStatefulWidget {
  final BaseController controller;
  final ProviderListenable<MapScene> sceneProvider;
  final List<Widget> mapLayers;

  const MapGestureBridge({
    required this.controller,
    required this.sceneProvider,
    required this.mapLayers,
    super.key,
  });

  @override
  ConsumerState<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends ConsumerState<MapGestureBridge> {
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  MapGestureHandler get gestureHandler => ref.read(
    mapGestureHandlerProvider(widget.sceneProvider, widget.controller),
  );

  void _resolve(PointerEventType type, PointerEvent event) {
    final offset = ref
        .read(mapCameraHolderProvider)
        .screenToWorld(ScreenOffset(event.localPosition));
    gestureHandler.resolve(type, offset);
    _panAllowed.value = gestureHandler.panAllowed;
  }

  @override
  void dispose() {
    gestureHandler.dispose();
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
      child: PanLock(
        notifier: _panAllowed,
        child: MapCanvas(
          sceneProvider: widget.sceneProvider,
          layers: widget.mapLayers,
        ),
      ),
    );
  }
}
