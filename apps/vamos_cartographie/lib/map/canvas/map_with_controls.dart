import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/canvas/layers/layers.dart';
import 'package:vamos_cartographie/map/canvas/layers/sketch_layer/correction_sketch_layer.dart';
import 'package:vamos_cartographie/map/canvas/layers/user_location_layer.dart';
import 'package:vamos_cartographie/map/map.dart';

class MapWithControls extends ConsumerStatefulWidget {
  final TripId tripId;
  final MapController mapController;
  final ValueListenable<bool> panAllowed;

  const MapWithControls({
    super.key,
    required this.tripId,
    required this.mapController,
    required this.panAllowed,
  });
  @override
  ConsumerState<MapWithControls> createState() => _MapWithControlsState();
}

class _MapWithControlsState extends ConsumerState<MapWithControls> {
  late final List<Widget> _mapChildren;

  @override
  void initState() {
    super.initState();
    _mapChildren = [
      MapTileLayer(),
      const NetworkOverlayLayer(), // instance unique, stable, auto-réactive
      SegmentLayer(tripId: widget.tripId),
      CursorLayer(tripId: widget.tripId),
      CorrectionSketchLayer(tripId: widget.tripId),
      SegmentSketchLayer(tripId: widget.tripId),
      VertexLayer(tripId: widget.tripId),
      PencilSketchLayer(tripId: widget.tripId),
      UserLocationLayer(),
      MapControls(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print("map_canvas rebuild");
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
