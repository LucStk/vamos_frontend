import 'dart:math';

import 'package:domain_core/id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/hit_engine/hit_engine.dart';
import 'package:map_application/map_hit_resolver.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import 'package:vamos_cartographie/topology/injection/providers/graph_store.dart';

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
  late final ValueNotifier<LayerHitResult<MapHit>?> _hitNotifier;

  @override
  MapHitState state = const EmptyState();

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _hitNotifier = ValueNotifier<LayerHitResult<MapHit>?>(null);
  }

  @override
  void dispose() {
    _mapController.dispose();
    _hitNotifier.dispose();
    super.dispose();
  }

  MapHit _currentHit() =>
      _hitNotifier.value?.hitValues.firstOrNull ?? const NoHit();

  Point<double> _toPoint(Offset offset) => Point(offset.dx, offset.dy);

  LatLng _toLatLng(Offset offset) =>
      _mapController.camera.posToLatLng(Point(offset.dx, offset.dy));

  void _dispatch(MapEvent? event) {
    if (event == null) return;
    ref.read(mapStateProvider(widget.tripId).notifier).sendUiEvent(event);
  }

  void _onPointerDown(PointerDownEvent event) {
    _dispatch(onPointerDown(_currentHit(), _toPoint(event.localPosition)));
  }

  void _onPointerMove(PointerMoveEvent event) {
    _dispatch(
      onPointerMove(
        _currentHit(),
        _toPoint(event.localPosition),
        _toLatLng(event.localPosition),
      ),
    );
  }

  void _onPointerUp(PointerUpEvent event) {
    _dispatch(
      onPointerUp(
        _currentHit(),
        _toPoint(event.localPosition),
        _toLatLng(event.localPosition),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        mapControllerProvider.overrideWithValue(_mapController),
        hitLayerProvider.overrideWithValue(_hitNotifier),
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
