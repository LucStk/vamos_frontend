// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/map_engine/map_hit_engine_widget.dart';
import 'map_bottom_sheet.dart';
import '/map/injection/map_state_provider.dart';
import '/map/rendering/rendering.dart';
import '/map/presentation/widgets/widgets.dart';

class MapScreen extends StatelessWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const MapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapHitEngineWidget(
            tripId: tripId,
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: const LatLng(46.8, 2.2),
                initialZoom: 7,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom,
                ),
              ),
              children: [
                MapTileLayer(),
                SegmentLayer(tripId: tripId),
                VertexLayer(tripId: tripId),
                CursorLayer(tripId: tripId),
                SketchLayer(tripId: tripId),
                MapControls(mapController: _mapController),
              ],
            ),
          ),
          MapTopBar(tripId: tripId),
          // PopUpOverlay(tripId: widget.tripId, mapController: _mapController),
          MapBottomSheet(tripId: tripId),
        ],
      ),
    );
  }
}
