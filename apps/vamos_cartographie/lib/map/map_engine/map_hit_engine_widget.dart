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
  late final ValueNotifier<LayerHitResult<MapHit>?> _vertexHitNotifier;
  late final ValueNotifier<LayerHitResult<MapHit>?> _cursorHitNotifier;
  late final ValueNotifier<LayerHitResult<MapHit>?> _segmentHitNotifier;
  late final ValueNotifier<LayerHitResult<MapHit>?> _sketchHitNotifier;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _vertexHitNotifier = ValueNotifier(null);
    _cursorHitNotifier = ValueNotifier(null);
    _segmentHitNotifier = ValueNotifier(null);
    _sketchHitNotifier = ValueNotifier(null);
    _shouldPanMapNotifier = ValueNotifier(true);
  }

  @override
  void dispose() {
    _mapController.dispose();
    _vertexHitNotifier.dispose();
    _cursorHitNotifier.dispose();
    _segmentHitNotifier.dispose();
    _sketchHitNotifier.dispose();

    _shouldPanMapNotifier.dispose();
    super.dispose();
  }

  MapHit _currentHit() {
    // Priorité : vertex > cursor > segment > vide
    if (_vertexHitNotifier.value?.hitValues.firstOrNull case final hit?) {
      return hit;
    }
    if (_cursorHitNotifier.value?.hitValues.firstOrNull case final hit?) {
      return hit;
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
        vertexHitLayerProvider.overrideWithValue(_vertexHitNotifier),
        cursorHitLayerProvider.overrideWithValue(_cursorHitNotifier),
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
    final hit = _currentHit();
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
