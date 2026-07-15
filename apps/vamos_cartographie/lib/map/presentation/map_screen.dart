// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/presentation/bottom_sheet/map_bottom_sheet.dart';
import '/map/injection/map_state_provider.dart';
import '/map/rendering/rendering.dart';
import '/map/presentation/widgets/widgets.dart';
import '/trip/injection/trip_queries.dart';

class MapScreen extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const MapScreen({super.key, required this.tripId, this.isOwner = true});
  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  // 1. Déclarer la variable du contrôleur
  late final MapController _mapController;

  @override
  void initState() {
    super.initState();
    // 2. Initialiser le contrôleur au démarrage du widget
    _mapController = MapController();
    // Aller chercher sur le réseau les élements topologique
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(loadTripDetailsProvider(widget.tripId));
    });
  }

  @override
  void dispose() {
    // 3. Libérer les ressources du contrôleur à la fermeture de l'écran
    _mapController.dispose();
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
              onTap: (_, latLng) => mapState.sendUiEvent(MapTapped(latLng)),
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom,
              ),
            ),
            children: [
              MapTileLayer(),
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
