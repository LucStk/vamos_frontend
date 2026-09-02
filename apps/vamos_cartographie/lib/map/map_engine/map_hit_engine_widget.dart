import 'dart:math';

import 'package:domain_core/id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart' hide MapEvent;
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import 'package:vamos_cartographie/topology/topology.dart';

class MapElementEngineWidget extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  final Widget child;

  const MapElementEngineWidget({
    super.key,
    required this.tripId,
    required this.child,
  });

  @override
  ConsumerState<MapElementEngineWidget> createState() =>
      _MapElementEngineWidgetState();
}

class _MapElementEngineWidgetState extends ConsumerState<MapElementEngineWidget>
    with MapHitTester, PointerGestureController, TickerProviderStateMixin {
  late final MapController _mapController;
  late final AnimatedMapController _animatedMapController;
  late final ValueNotifier<LayerHitResult<MapElement>?> _segmentHitNotifier;
  late final ValueNotifier<LayerHitResult<MapElement>?> _sketchHitNotifier;

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
    _segmentHitNotifier = ValueNotifier(null);
    _sketchHitNotifier = ValueNotifier(null);

    mapEditor.attachCamera(_FlutterMapCameraController(_animatedMapController));
  }

  // Contrats MapHitTester — branchement Flutter/Riverpod ici uniquement
  @override
  void setPanBlocked(bool blocked) {
    if (blocked) {
      panMapController.block();
    } else {
      panMapController.allow();
    }
  }

  @override
  MapMode get hitMode => mapEditor.mode;
  @override
  MapSelection get hitSelection => mapEditor.selection;
  @override
  List<VertexFields> get vertices => ref.read(allVertexProvider(widget.tripId));
  @override
  List<SegmentFields> get segments =>
      ref.read(allSegmentsProvider(widget.tripId));
  @override
  Point<double> Function(LatLng) get project => (latLng) {
    final offset = _mapController.camera.latLngToScreenOffset(latLng);
    return Point(offset.dx, offset.dy);
  };

  // Contrat PointerGestureController
  @override
  MapEditor get mapEditor => ref.read(mapStateProvider(widget.tripId).notifier);
  @override
  GestureState state = const EmptyState();

  LatLng _toLatLng(Offset offset) =>
      _mapController.camera.screenOffsetToLatLng(offset);

  PanMapController get panMapController =>
      ref.read(panMapControllerProvider.notifier);

  @override
  void dispose() {
    cancelPendingTap();
    _animatedMapController.dispose();
    _mapController.dispose();
    _segmentHitNotifier.dispose();
    _sketchHitNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        mapControllerProvider.overrideWithValue(_mapController),
        animatedMapControllerProvider.overrideWithValue(_animatedMapController),
        segmentHitLayerProvider.overrideWithValue(_segmentHitNotifier),
        sketchHitLayerProvider.overrideWithValue(_sketchHitNotifier),
      ],
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (event) {
          onPointerDown(latLng: _toLatLng(event.localPosition));
        },
        onPointerMove: (event) =>
            onPointerMove(latLng: _toLatLng(event.localPosition)),
        onPointerUp: (event) {
          panMapController.allow();
          onPointerUp(_toLatLng(event.localPosition));
        },
        child: widget.child,
      ),
    );
  }
}

/// Seul point de contact Flutter pour le zoom — reçoit directement
/// l'instance de MapController du widget, sans passer par Riverpod.
class _FlutterMapCameraController implements MapCameraController {
  final AnimatedMapController animatedController;
  _FlutterMapCameraController(this.animatedController);

  @override
  void zoomTo(LatLng latLng, {double deltaZoom = 1}) {
    final camera = animatedController.mapController.camera;
    final targetZoom = min(camera.zoom + deltaZoom, camera.maxZoom ?? 20);
    animatedController.animateTo(dest: latLng, zoom: targetZoom);
  }
}
