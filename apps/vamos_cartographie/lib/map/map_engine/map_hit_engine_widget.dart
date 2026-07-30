import 'package:domain_core/id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/hit_engine/hit_engine.dart';
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

class _MapHitEngineWidgetState extends ConsumerState<MapHitEngineWidget> {
  late final MapController _mapController;
  // 1. Un seul ValueNotifier typé avec NotifierHit
  late final ValueNotifier<LayerHitResult<MapHit>?> _hitNotifier;

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

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        // Injection des dépendances pour tous les enfants sous ce ProviderScope
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

  void _onPointerDown(PointerDownEvent event) {
    final mapState = ref.read(mapStateProvider(widget.tripId).notifier);
    final touchPos = event.localPosition;

    // 1. PRIORITÉ 1 : Test de collision sur les VERTEX (Rayon de 24px)
    final vertices = ref.read(vertexStoreProvider(widget.tripId)).getAll();
    final hitVertexId = _findHitVertex(
      touchPosition: touchPos,
      vertices: vertices,
      mapController: _mapController,
    );

    if (hitVertexId != null) {
      return;
    }

    // 2. PRIORITÉ 2 : Test de collision sur les POLYLINES (via hitNotifier)
    final polyHit = widget.polylineHitNotifier.value?.hitValues.firstOrNull;
    if (polyHit case SegmentHit(segmentId: final id)) {
      mapState.sendUiEvent(SegmentTapped(id));
      return;
    } else if (polyHit is SketchSegmentHit) {
      final latLng = widget.mapController.camera.pointToLatLng(
        Point(touchPos.dx, touchPos.dy),
      );
      mapState.sendUiEvent(SketchSegmentTapped(latLng));
      return;
    }

    // 3. PRIORITÉ 3 : Clic dans le vide sur la carte
    final mapLatLng = widget.mapController.camera.pointToLatLng(
      Point(touchPos.dx, touchPos.dy),
    );
    mapState.sendUiEvent(MapTapped(mapLatLng));
  }

  void _onPointerMove(PointerMoveEvent event) {
    // Si on est en train de glisser un vertex
    if (_draggedVertexId != null) {
      final newLatLng = widget.mapController.camera.pointToLatLng(
        Point(event.localPosition.dx, event.localPosition.dy),
      );

      ref
          .read(mapStateProvider(widget.tripId).notifier)
          .sendUiEvent(VertexDragged(_draggedVertexId!, newLatLng));
    }
  }

  void _onPointerUp(PointerUpEvent event) {
    if (_draggedVertexId != null) {
      ref
          .read(mapStateProvider(widget.tripId).notifier)
          .sendUiEvent(VertexGrabEnded(_draggedVertexId!));
      _draggedVertexId = null;
    }
  }
}
