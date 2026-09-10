import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/canvas/layers/layers.dart';
import 'package:vamos_cartographie/map/canvas/markers/markers.dart';
import 'package:vamos_cartographie/map/map.dart';

class MapCanvas extends ConsumerStatefulWidget {
  final TripId tripId;
  final MapController mapController;
  final ValueListenable<bool> panAllowed;

  const MapCanvas({
    super.key,
    required this.tripId,
    required this.mapController,
    required this.panAllowed,
  });
  @override
  ConsumerState<MapCanvas> createState() => _MapCanvasState();
}

class _MapCanvasState extends ConsumerState<MapCanvas> {
  late final List<Widget> _mapChildren;

  @override
  void initState() {
    super.initState();
    _mapChildren = [
      MapTileLayer(),
      const NetworkOverlayLayer(), // instance unique, stable, auto-réactive
      MapControls(tripId: widget.tripId),
    ];
  }

  List<Widget> buildScene(MapScene scene) {
    final List<Marker> markers = [];
    final List<Polyline> polylines = [];
    for (MapPoint p in scene.points) {
      final m = Marker(
        point: p.position,
        width: p.radius,
        height: p.radius,
        child: mapPointToWidget(p),
      );
      markers.add(m);
    }
    for (MapLine p in scene.lines) {
      final m = Marker(
        point: p.position,
        width: p.radius,
        height: p.radius,
        child: mapPointToWidget(p),
      );
      markers.add(m);
    }
    return [MarkerLayer(markers: markers)];
  }

  Widget mapPointToMarker(MapPoint p) {
    switch (p) {
      case MapVertex v:
        return VertexMarker(
          tripId: widget.tripId,
          vertexId: v.id,
          isDragging: false,
        );
      default:
        return SizedBox.shrink();
    }
  }

  Widget mapLineToPolyline(MapLine p) {
    switch (p) {
      case MapSegment v:
        return VertexMarker(
          tripId: widget.tripId,
          vertexId: v.id,
          isDragging: false,
        );
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.panAllowed,
      builder: (context, panAllowed, _) => FlutterMap(
        mapController: widget.mapController,
        options: MapOptions(
          initialCenter: const LatLng(46.8, 2.2),
          initialZoom: 7,
          interactionOptions: InteractionOptions(
            flags: panAllowed
                ? InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom
                : InteractiveFlag.all &
                      ~InteractiveFlag.doubleTapZoom &
                      ~InteractiveFlag.drag,
          ),
        ),
        children: _mapChildren, // référence stable, capturée par la closure
      ),
    );
  }
}
