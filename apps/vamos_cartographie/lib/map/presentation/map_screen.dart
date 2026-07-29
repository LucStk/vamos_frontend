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
  // 1. Un seul ValueNotifier typé avec NotifierHit
  late final ValueNotifier<LayerHitResult<NotifierHit>?> _hitNotifier;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _hitNotifier = ValueNotifier<LayerHitResult<NotifierHit>?>(null);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(mapStateProvider(widget.tripId).notifier).loadTripDetails();
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    _hitNotifier.dispose();
    super.dispose();
  }

  void _onTap(LatLng latLng) {
    // Il est préférable d'utiliser ref.read() dans un callback (onTap) plutôt que watch()
    final mapState = ref.read(mapStateProvider(widget.tripId).notifier);

    // 2. On récupère le hit via l'extension
    final topHit = _hitNotifier.topHit;

    // 3. Pattern Matching de Dart 3 🚀
    switch (topHit) {
      case SegmentHit(segmentId: final id):
        mapState.sendUiEvent(SegmentTapped(id));
        print("Segment tapped: $id");

      case SketchSegmentHit():
        // Gérer le clic sur le tracé en cours si nécessaire
        // ex: mapState.sendUiEvent(SketchTapped());
        print("Sketch segment tapped");

      case NoHit():
        mapState.sendUiEvent(MapTapped(latLng));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(46.8, 2.2),
              initialZoom: 7,
              onTap: (_, latLng) => _onTap(latLng),
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom,
              ),
            ),
            children: [
              MapTileLayer(),
              SegmentLayer(tripId: widget.tripId, hitNotifier: _hitNotifier),
              VertexLayer(tripId: widget.tripId),
              CursorLayer(tripId: widget.tripId),
              SketchLayer(tripId: widget.tripId, hitNotifier: _hitNotifier),
              MapControls(mapController: _mapController),
            ],
          ),
          // PopUpOverlay(tripId: widget.tripId, mapController: _mapController),
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
