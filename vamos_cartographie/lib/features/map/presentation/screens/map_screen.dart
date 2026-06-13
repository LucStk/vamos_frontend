// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/map/presentation/helpers/on_map_tap.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';

import 'package:vamos_cartographie/features/map/presentation/layers/layers.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class MapScreen extends StatefulWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const MapScreen({super.key, required this.tripId, this.isOwner = true});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            // mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(46.8, 2.2),
              initialZoom: 7,
              onTap: (_, latLng) => onMapTap(context, latLng, widget.tripId),
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom,
              ),
            ),
            children: [
              MapTileLayer(),
              TopologyLayer(tripId: widget.tripId),
            ],
          ),
          MapTopBar(tripId: widget.tripId),
        ],
      ),
    );
  }
}
