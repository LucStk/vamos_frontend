import 'dart:math';

import 'package:domain_core/id.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart' hide MapEvent;
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/injection/gesture_state_provider.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/map/injection/map_camera_controller_provider.dart';
import 'package:vamos_cartographie/map/map_input/flutter_map_camera_controller.dart';
import 'package:vamos_cartographie/topology/topology.dart';

class MapGestureBridge extends ConsumerStatefulWidget {
  final Id<Trip> tripId;

  const MapGestureBridge({super.key, required this.tripId});

  @override
  ConsumerState<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends ConsumerState<MapGestureBridge>
    with TickerProviderStateMixin {
  late final MapController _mapController;
  late final AnimatedMapController _animatedMapController;
  late final MapHitTester _hitTester;
  late final PointerGestureController _gestureController;
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  GestureStateNotifier get _gestureState =>
      ref.read(gestureStateProvider(widget.tripId).notifier);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    _animatedMapController = AnimatedMapController(
      vsync: this,
      mapController: _mapController, // même instance sous-jacente
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
    _hitTester = MapHitTester(builtScene);

    _gestureController = PointerGestureController(
      hitTester: _hitTester,
      mapContext: _mapContext,
      setPanBlocked: (blocked) => _panAllowed.value = !blocked,
    );
  }

  /// Point d'entrée unique côté widget : traduit un Offset écran en LatLng,
  /// construit l'événement, applique la transition via le contrôleur pur,
  /// et persiste le nouvel état dans le notifier.

  void _dispatch(MapPointerEvent Function(LatLng) buildEvent, Offset offset) {
    final latLng = _mapController.camera.screenOffsetToLatLng(offset);
    final event = buildEvent(latLng);
    final currentState = ref.read(gestureStateProvider(widget.tripId));
    _gestureState.update(_gestureController.handle(currentState, event));
  }

  @override
  void dispose() {
    _gestureController.dispose();
    _animatedMapController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Réattache à chaque build — survit au hot reload, voir discussion
    // sur le champ _cameraController réinitialisé à null par le reload.
    return ProviderScope(
      overrides: [
        mapCameraControllerProvider.overrideWithValue(
          FlutterMapCameraController(_animatedMapController),
        ),
      ],
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (event) =>
            _dispatch(MapPointerDown.new, event.localPosition),
        onPointerMove: (event) =>
            _dispatch(MapPointerMove.new, event.localPosition),
        onPointerUp: (event) =>
            _dispatch(MapPointerUp.new, event.localPosition),
        child: MapCanvas(
          tripId: widget.tripId,
          panAllowed: _panAllowed,
          mapController: _mapController,
        ),
      ),
    );
  }
}

/// Seul point de contact Flutter pour le zoom — reçoit directement
/// l'AnimatedMapController du widget, sans passer par Riverpod.
