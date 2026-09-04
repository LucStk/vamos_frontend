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

  MapEditor get _mapEditor =>
      ref.read(mapStateProvider(widget.tripId).notifier);

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
    _hitTester = MapHitTester(
      hitMode: () => _mapEditor.mode,
      hitSelection: () => _mapEditor.selection,
      vertices: () => ref.read(allVertexProvider(widget.tripId)),
      segments: () => ref.read(allSegmentsProvider(widget.tripId)),
      project: (latLng) {
        final offset = _mapController.camera.latLngToScreenOffset(latLng);
        return Point(offset.dx, offset.dy);
      },
    );

    _gestureController = PointerGestureController(
      hitTester: _hitTester,
      mapEditor: _mapEditor,
      setPanBlocked: (blocked) => _panAllowed.value = !blocked,
    );

    _mapEditor.attachCamera(FlutterMapCameraController(_animatedMapController));
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
    _mapEditor.attachCamera(FlutterMapCameraController(_animatedMapController));

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) =>
          _dispatch(MapPointerDown.new, event.localPosition),
      onPointerMove: (event) =>
          _dispatch(MapPointerMove.new, event.localPosition),
      onPointerUp: (event) => _dispatch(MapPointerUp.new, event.localPosition),
      child: MapCanvas(
        tripId: widget.tripId,
        panAllowed: _panAllowed,
        mapController: _mapController,
      ),
    );
  }
}

/// Seul point de contact Flutter pour le zoom — reçoit directement
/// l'AnimatedMapController du widget, sans passer par Riverpod.
