import 'package:domain_core/id.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart' hide MapEvent;
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/map_input/pointer_event_resolver_impl.dart';
import 'package:vamos_cartographie/map/overlay_ui/overlay_ui.dart';
import 'package:vamos_cartographie/map_canvas/flutter_map_camera_controller.dart';
import 'package:vamos_cartographie/map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map_canvas/map_canvas_view.dart';

class MapGestureBridge extends ConsumerStatefulWidget {

  const MapGestureBridge({super.key, required this.tripId});

  @override
  ConsumerState<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends ConsumerState<MapGestureBridge>
    with TickerProviderStateMixin {
  late final MapController _mapController;
  late final AnimatedMapController _animatedMapController;
  late final PointerEventsResolverImpl _pointerEventsResolver;
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _mapController = ref.read(mapControllerProvider);

    _animatedMapController = AnimatedMapController(
      vsync: this,
      mapController: _mapController,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );

    _pointerEventsResolver = PointerEventsResolverImpl(
      ref: ref,
      tripId: widget.tripId,
      onPanBlockedChanged: (blocked) => _panAllowed.value = !blocked,
    );

    // Différé après la fin du build en cours
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref
          .read(mapCameraControllerHolderProvider.notifier)
          .set(FlutterMapCameraController(_animatedMapController));
    });
  }

  @override
  void dispose() {
    _pointerEventsResolver.dispose();
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (event) => _pointerEventsResolver.handle(
            MapPointerDown(event.localPosition),
          ),
          onPointerMove: (event) => _pointerEventsResolver.handle(
            MapPointerMove(event.localPosition),
          ),
          onPointerUp: (event) =>
              _pointerEventsResolver.handle(MapPointerUp(event.localPosition)),
          child: MapCanvas(
            painter: ,
            panAllowed: _panAllowed,
            mapController: _mapController,
          ),
    );
  }
}

/// Seul point de contact Flutter pour le zoom — reçoit directement
/// l'AnimatedMapController du widget, sans passer par Riverpod.
