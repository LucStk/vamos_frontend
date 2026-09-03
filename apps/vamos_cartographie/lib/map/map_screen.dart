// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/map_input/map_gesture_bridge.dart';
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
          MapGestureBridge(tripId: tripId),
          MapTopBar(tripId: tripId),
          MapBottomSheet(tripId: tripId),
        ],
      ),
    );
  }
}
