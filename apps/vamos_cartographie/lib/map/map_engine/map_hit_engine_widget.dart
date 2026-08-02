import 'dart:math';

import 'package:domain_core/id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart' hide MapEvent;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import 'package:vamos_cartographie/map/map_engine/vertex_hit_test.dart';
import 'package:vamos_cartographie/topology/topology.dart';

class MapHitEngineWidget extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  final Widget child;

  const MapHitEngineWidget({
    super.key,
    required this.tripId,
    required this.child,
  });

  @override
  ConsumerState<MapHitEngineWidget> createState() => _MapHitEngineWidgetState();
}

class _MapHitEngineWidgetState extends ConsumerState<MapHitEngineWidget>
    with MapHitResolver {
  late final MapController _mapController;
  late final ValueNotifier<bool> _shouldPanMapNotifier;
  late final ValueNotifier<LayerHitResult<MapHit>?> _segmentHitNotifier;
  late final ValueNotifier<LayerHitResult<MapHit>?> _sketchHitNotifier;

  List<VertexFields> get vertices => ref.read(allVertexProvider(widget.tripId));

  Offset? get cursorPosition {
    final state = ref.read(mapStateProvider(widget.tripId));
    final latLng = state.selection.cursorLatLngOrNull;
    if (latLng == null) return null;
    return _mapController.camera.latLngToScreenOffset(latLng);
  }

  Offset? get pencilPosition {
    final state = ref.read(mapStateProvider(widget.tripId));
    final LatLng? latLng = state.mode.pencilPositionOrNull;
    if (latLng == null) return null;
    return _mapController.camera.latLngToScreenOffset(latLng);
  }

  // Offset? get pencilSketchPosition {
  //   final state = ref.read(mapStateProvider(widget.tripId));
  //   switch (state.mode){
  //     case Sketch e :
  //       e.
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _segmentHitNotifier = ValueNotifier(null);
    _sketchHitNotifier = ValueNotifier(null);
    _shouldPanMapNotifier = ValueNotifier(true);
  }

  @override
  void dispose() {
    _mapController.dispose();
    _segmentHitNotifier.dispose();
    _sketchHitNotifier.dispose();
    _shouldPanMapNotifier.dispose();
    super.dispose();
  }

  MapHit _hitTest(Offset position) {
    // Priorité : pencil > vertex > cursor > segment > vide

    final hitVertices = hitTestVertex(
      point: position,
      mapController: _mapController,
      vertices: vertices,
    );
    // On regarde si le pencil n'a pas rencontré un vertex
    if (pencilPosition != null) {
      const thresholdPx = 10;
      final dist = (position - pencilPosition!).distance;
      if (dist <= thresholdPx) {
        return SketchPencilHit(hitVertices[0].vertex.id);
      }
    }
    if (hitVertices.isNotEmpty) return hitVertices[0];

    // TestHit Cursor
    if (cursorPosition != null) {
      const thresholdPx = 10;
      final dist = (position - cursorPosition!).distance;
      if (dist <= thresholdPx) {
        return CursorHit();
      }
    }

    if (_segmentHitNotifier.value?.hitValues.firstOrNull case final hit?) {
      return hit;
    }

    if (_sketchHitNotifier.value?.hitValues.firstOrNull case final hit?) {
      return hit;
    }
    return const NoHit();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        mapControllerProvider.overrideWithValue(_mapController),
        shouldPanMapProvider.overrideWithValue(_shouldPanMapNotifier),
        segmentHitLayerProvider.overrideWithValue(_segmentHitNotifier),
        sketchHitLayerProvider.overrideWithValue(_sketchHitNotifier),
      ],
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: _onPointerDown,
        onPointerMove: _onPointerMove,
        onPointerUp: _onPointerUp,
        child: widget.child,
      ),
    );
  }

  @override
  MapHitState state = const EmptyState();

  set shouldPanMap(bool shouldPanMap) {
    if (_shouldPanMapNotifier.value != shouldPanMap) {
      _shouldPanMapNotifier.value = shouldPanMap;
    }
  }

  Point<double> _toPoint(Offset offset) => Point(offset.dx, offset.dy);

  LatLng _toLatLng(Offset offset) =>
      _mapController.camera.screenOffsetToLatLng(offset);

  void _dispatch(MapEvent? event) {
    if (event == null) return;
    // Accès au notifier via ref (StateController / StateNotifier)
    ref.read(mapStateProvider(widget.tripId).notifier).sendUiEvent(event);
  }

  void _onPointerDown(PointerDownEvent event) {
    final hit = _hitTest(event.localPosition);
    shouldPanMap = !isDraggable(hit);
    _dispatch(onPointerDown(hit: hit, point: _toPoint(event.localPosition)));
  }

  void _onPointerMove(PointerMoveEvent event) {
    _dispatch(
      onPointerMove(
        point: _toPoint(event.localPosition),
        latLng: _toLatLng(event.localPosition),
      ),
    );
  }

  void _onPointerUp(PointerUpEvent event) {
    shouldPanMap = true;
    _dispatch(onPointerUp(_toLatLng(event.localPosition)));
  }
}
