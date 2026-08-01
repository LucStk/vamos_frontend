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
  late final ValueNotifier<LayerHitResult<MapHit>?> _hitNotifier;
  late final ValueNotifier<bool> _shouldPanMapNotifier;

  @override
  MapHitState state = const EmptyState();

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _hitNotifier = ValueNotifier<LayerHitResult<MapHit>?>(null);
    _shouldPanMapNotifier = ValueNotifier(true);
  }

  @override
  void dispose() {
    _mapController.dispose();
    _hitNotifier.dispose();
    _shouldPanMapNotifier.dispose();
    super.dispose();
  }

  void _syncShouldPanMap() {
    final value = this.shouldPanMap;
    if (_shouldPanMapNotifier.value != value) {
      _shouldPanMapNotifier.value = value;
    }
  }

  MapHit _currentHit() =>
      _hitNotifier.value?.hitValues.firstOrNull ?? const NoHit();

  Point<double> _toPoint(Offset offset) => Point(offset.dx, offset.dy);

  LatLng _toLatLng(Offset offset) =>
      _mapController.camera.screenOffsetToLatLng(offset);

  void _dispatch(MapEvent? event) {
    _syncShouldPanMap();
    if (event == null) return;

    // Accès au notifier via ref (StateController / StateNotifier)
    ref.read(mapStateProvider(widget.tripId).notifier).sendUiEvent(event);
  }

  void _onPointerDown(PointerDownEvent event) {
    _dispatch(
      onPointerDown(hit: _currentHit(), point: _toPoint(event.localPosition)),
    );
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
    _dispatch(onPointerUp(_toLatLng(event.localPosition)));
  }

  @override
  Widget build(BuildContext context) {
    // Si la récréation du ProviderScope au rebuild pose problème dans votre UI,
    // entourez ce widget d'un ProviderScope parent ou vérifiez le comportement du cache.
    return ProviderScope(
      overrides: [
        mapControllerProvider.overrideWithValue(_mapController),
        hitLayerProvider.overrideWithValue(_hitNotifier),
        shouldPanMapProvider.overrideWithValue(_shouldPanMapNotifier),
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
