// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/cursor_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/cursor_layer.dart';
import 'package:vamos_cartographie/features/map/presentation/overlays/vertex_pop_up_overlay.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/layers.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

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
  }

  @override
  void dispose() {
    // 3. Libérer les ressources du contrôleur à la fermeture de l'écran
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cursorProvider = ref.watch(mapCursorProvider(widget.tripId).notifier);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            // 4. Passer le contrôleur à FlutterMap
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(46.8, 2.2),
              initialZoom: 7,
              onTap: (_, latLng) {
                cursorProvider.setPosition(latLng);
                cursorProvider.open();
                debugPrint("cursor Set $latLng");
              },
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom,
              ),
            ),
            children: [
              MapTileLayer(),
              TopologyLayer(tripId: widget.tripId),
              // 5. Passer le contrôleur à tes boutons/widgets de contrôle de la carte
              MapControls(mapController: _mapController),
              CursorLayer(tripId: widget.tripId),
            ],
          ),
          VertexPopUpOverlay(
            tripId: widget.tripId,
            mapController: _mapController,
          ), // déssine par dessus la map
          // CursorPopUpOverlay(
          //   tripId: widget.tripId,
          //   mapController: _mapController,
          // ),
          MapTopBar(tripId: widget.tripId),
        ],
      ),
    );
  }
}
