// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'map_bottom_sheet.dart';
import '/map/injection/map_state_provider.dart';
import '/map/rendering/rendering.dart';
import '/map/presentation/widgets/widgets.dart';

class MapScreen extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const MapScreen({super.key, required this.tripId, this.isOwner = true});
  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  late final MapController _mapController;
  late final ValueNotifier<LayerHitResult<SegmentId>?> _segmentHitNotifier;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _segmentHitNotifier = ValueNotifier<LayerHitResult<SegmentId>?>(null);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(mapStateProvider(widget.tripId).notifier).loadTripDetails();
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    _segmentHitNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapStateProvider(widget.tripId).notifier);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(46.8, 2.2),
              initialZoom: 7,
              onTap: (_, latLng) {
                final hit = _segmentHitNotifier.value;
                if (hit != null && hit.hitValues.isNotEmpty) {
                  mapState.sendUiEvent(SegmentTapped(hit.hitValues.first));
                  print("segment tapped");
                } else {
                  mapState.sendUiEvent(MapTapped(latLng));
                }
              },
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom,
              ),
            ),
            children: [
              MapTileLayer(),
              SegmentLayer(
                tripId: widget.tripId,
                hitNotifier: _segmentHitNotifier,
              ),
              VertexLayer(tripId: widget.tripId),
              CursorLayer(tripId: widget.tripId),
              SketchLayer(tripId: widget.tripId),
              MapControls(mapController: _mapController),
            ],
          ),
          PopUpOverlay(tripId: widget.tripId, mapController: _mapController),
          MapTopBar(tripId: widget.tripId),
          MapBottomSheet(tripId: widget.tripId),
        ],
      ),
    );
  }
}
// Permet au controlleur d'afficher des widgets
//
// ref.listen<MapOutputQueue>(mapOutputProvider(widget.tripId), (_, _) async {
//   final notifier = ref.read(mapOutputProvider(widget.tripId).notifier);

//   while (true) {
//     final event = notifier.pop();
//     if (event == null) break;

//     switch (event) {
//       case OpenWaypointDialogEvent(:final waypointId):
//         await WaypointViewerBottomSheet.show(
//           context: context,
//           waypointId: waypointId,
//           tripId: widget.tripId,
//         );

//       case _:
//     }
//   }
// });
