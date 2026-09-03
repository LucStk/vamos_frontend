import 'dart:math';

import 'package:domain_core/id.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart' hide MapEvent;
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/map_camera_controller.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/canvas/map_with_controls.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/topology/topology.dart';

class MapElementEngineWidget extends ConsumerStatefulWidget {
  final Id<Trip> tripId;

  const MapElementEngineWidget({super.key, required this.tripId});

  @override
  ConsumerState<MapElementEngineWidget> createState() =>
      _MapElementEngineWidgetState();
}

class _MapElementEngineWidgetState extends ConsumerState<MapElementEngineWidget>
    with TickerProviderStateMixin {
  late final MapController _mapController;
  late final AnimatedMapController _animatedMapController;
  late final MapHitTester _hitTester;
  late final PointerGestureController _gestureController;
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  MapEditor get _mapEditor =>
      ref.read(mapStateProvider(widget.tripId).notifier);

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

  LatLng _toLatLng(Offset offset) =>
      _mapController.camera.screenOffsetToLatLng(offset);

  /// Point d'entrée unique côté widget : traduit un Offset écran en LatLng,
  /// construit l'événement, applique la transition via le contrôleur pur,
  /// et persiste le nouvel état dans le notifier.
  void _dispatch(MapPointerEvent Function(LatLng) buildEvent, Offset offset) {
    final latLng = _toLatLng(offset);
    final event = buildEvent(latLng);
    _gestureState.dispatch(_gestureController, event);
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
      child: MapWithControls(
        tripId: widget.tripId,
        panAllowed: _panAllowed,
        mapController: _mapController,
      ),
    );
  }
}

/// Seul point de contact Flutter pour le zoom — reçoit directement
/// l'AnimatedMapController du widget, sans passer par Riverpod.

// map_camera_controller.dart
class FlutterMapCameraController implements MapCameraController {
  final AnimatedMapController animatedController;
  FlutterMapCameraController(this.animatedController);

  MapCamera get _camera => animatedController.mapController.camera;

  @override
  void zoomTo(LatLng latLng, {double deltaZoom = 1}) {
    final targetZoom = min(_camera.zoom + deltaZoom, _camera.maxZoom ?? 20);
    animatedController.animateTo(dest: latLng, zoom: targetZoom);
  }

  @override
  Point<double> project(LatLng latLng) {
    final offset = _camera.latLngToScreenOffset(latLng);
    return Point(offset.dx, offset.dy);
  }

  @override
  void zoomIn() => animatedController.animatedZoomIn();

  @override
  void zoomOut() => animatedController.animatedZoomOut();

  @override
  void rotateTo(double degrees) => animatedController.animatedRotateTo(degrees);

  @override
  double get rotation => _camera.rotation;

  @override
  Stream<double> get rotationStream => animatedController
      .mapController
      .mapEventStream
      .map((_) => _camera.rotation);

  @override
  Point<double> latLngToPoint(LatLng latLng) {
    final offset = animatedController.mapController.camera.latLngToScreenOffset(
      latLng,
    );
    return Point(offset.dx, offset.dy);
  }

  @override
  LatLng pointToLatLng(Point<double> point) {
    final latLng = animatedController.mapController.camera.screenOffsetToLatLng(
      Offset(point.x, point.y),
    );
    return latLng;
  }
}
