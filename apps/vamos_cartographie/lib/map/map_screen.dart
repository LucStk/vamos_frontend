// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import '/map/canvas/map_with_controls.dart';
import '/map/map_engine/map_hit_engine_widget.dart';
import '/map/overlay_ui/overlay_ui.dart';

class MapScreen extends StatelessWidget {
  final Id<Trip> tripId;
  final bool isOwner;
  const MapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapElementEngineWidget(tripId: tripId),
          MapTopBar(tripId: tripId),
          MapBottomSheet(tripId: tripId),
        ],
      ),
    );
  }
}
