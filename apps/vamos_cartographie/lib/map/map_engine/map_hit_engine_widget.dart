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
    with MapElementResolver {
  late final MapController _mapController;
  late final ValueNotifier<bool> _shouldPanMapNotifier;
  late final ValueNotifier<LayerHitResult<MapElement>?> _segmentHitNotifier;
  late final ValueNotifier<LayerHitResult<MapElement>?> _sketchHitNotifier;

  List<VertexFields> get vertices => ref.read(allVertexProvider(widget.tripId));

  MapStateNotifier get mapEditor =>
      ref.read(mapStateProvider(widget.tripId).notifier);

  @override
  MapElementState state = const EmptyState();

  final _hitTester = const MapElementTester();

  // Seul point de contact avec flutter_map : la conversion LatLng -> écran
  Point<double> _project(LatLng latLng) {
    final offset = _mapController.camera.latLngToScreenOffset(latLng);
    return Point(offset.dx, offset.dy);
  }

  set shouldPanMap(bool shouldPanMap) {
    if (_shouldPanMapNotifier.value != shouldPanMap) {
      _shouldPanMapNotifier.value = shouldPanMap;
    }
  }

  Point<double> _toPoint(Offset offset) => Point(offset.dx, offset.dy);

  LatLng _toLatLng(Offset offset) =>
      _mapController.camera.screenOffsetToLatLng(offset);

  void _onPointerDown(PointerDownEvent event) {
    final hit = _hitTest(event.localPosition);
    shouldPanMap = !isDraggable(hit);
  }

  void _onPointerMove(PointerMoveEvent event) {
    mapEditor.handle(
      onPointerMove(
        point: _toPoint(event.localPosition),
        latLng: _toLatLng(event.localPosition),
        hitTest: (exclude) => _hitTest(event.localPosition, exclude: exclude),
      ),
    );
  }

  MapElement _hitTest(Offset position, {MapElement? exclude}) {
    var filteredVertices = vertices;

    if (exclude is MapSketchPencil) {
      final mode = mapEditor.mode;
      if (mode is Sketch) {
        filteredVertices = vertices
            .where((v) => v.id != mode.vertexStart)
            .toList();
      }
    }

    return _hitTester.resolve(
      position: Point(position.dx, position.dy),
      project: _project,
      vertices: filteredVertices, // ← vertex de départ absent
      cursorLatLng: mapEditor.selection.cursorLatLngOrNull,
      pencilLatLng: mapEditor.mode.pencilPositionOrNull,
      segmentHit: _segmentHitNotifier.value?.hitValues.firstOrNull,
      sketchHit: _sketchHitNotifier.value?.hitValues.firstOrNull,
      elementExclude: exclude,
    );
  }

  void _onPointerUp(PointerUpEvent event) {
    shouldPanMap = true;
    mapEditor.handle(onPointerUp(_toLatLng(event.localPosition)));
  }

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
}
