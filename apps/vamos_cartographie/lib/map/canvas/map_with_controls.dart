import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/canvas/layers/layers.dart';
import 'package:vamos_cartographie/map/canvas/layers/user_location_layer.dart';
import 'package:vamos_cartographie/map/map.dart';

class MapWithControls extends ConsumerStatefulWidget {
  final TripId tripId;
  const MapWithControls({super.key, required this.tripId});
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
      SegmentSketchLayer(tripId: widget.tripId),
      VertexLayer(tripId: widget.tripId),
      PencilSketchLayer(tripId: widget.tripId),
      UserLocationLayer(),
      MapControls(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final panController = ref.watch(panMapControllerProvider);
    final mapController = ref.watch(mapControllerProvider);

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: const LatLng(46.8, 2.2),
        initialZoom: 7,
        interactionOptions: InteractionOptions(
          flags: panController
              ? InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom
              : InteractiveFlag.all &
                    ~InteractiveFlag.doubleTapZoom &
                    ~InteractiveFlag.drag,
        ),
      ),
      children: _mapChildren, // référence stable retrouvée
    );
  }
}
