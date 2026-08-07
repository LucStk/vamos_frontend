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
    with MapElementResolver, MapHitTester {
  final _mapController = MapController();
  final _segmentHitNotifier = ValueNotifier<LayerHitResult<MapElement>?>(null);
  final _sketchHitNotifier = ValueNotifier<LayerHitResult<MapElement>?>(null);
  final _shouldPanMapNotifier = ValueNotifier(true);

  // Contrats MapHitTester — branchement Flutter/Riverpod ici uniquement
  @override
  MapMode get hitMode => mapEditor.mode;
  @override
  MapSelection get hitSelection => mapEditor.selection;
  @override
  List<VertexFields> get hitVertices =>
      ref.read(allVertexProvider(widget.tripId));
  @override
  MapElement? get segmentHit =>
      _segmentHitNotifier.value?.hitValues.firstOrNull;
  @override
  MapElement? get sketchHit => _sketchHitNotifier.value?.hitValues.firstOrNull;
  @override
  Point<double> Function(LatLng) get project => (latLng) {
    final offset = _mapController.camera.latLngToScreenOffset(latLng);
    return Point(offset.dx, offset.dy);
  };

  // Contrat MapElementResolver
  @override
  MapEditor get mapEditor => ref.read(mapStateProvider(widget.tripId).notifier);
  @override
  MapElementState state = const EmptyState();

  // Conversion Offset → types domaine (seul endroit Flutter dans la logique)
  LatLng _toLatLng(Offset offset) =>
      _mapController.camera.screenOffsetToLatLng(offset);
  Point<double> _toPoint(Offset offset) => Point(offset.dx, offset.dy);

  set shouldPanMap(bool value) {
    if (_shouldPanMapNotifier.value != value) {
      _shouldPanMapNotifier.value = value;
    }
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
        onPointerDown: (event) {
          final hit = hitTest(_toPoint(event.localPosition));
          shouldPanMap = !isDraggable(hit);
          onPointerDown(hit: hit, point: _toPoint(event.localPosition));
        },
        onPointerMove: (event) => onPointerMove(
          point: _toPoint(event.localPosition),
          latLng: _toLatLng(event.localPosition),
          hitTest: (exclude) =>
              hitTest(_toPoint(event.localPosition), exclude: exclude),
        ),
        onPointerUp: (event) {
          shouldPanMap = true;
          onPointerUp(_toLatLng(event.localPosition));
        },
        child: widget.child,
      ),
    );
  }
}
