// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/map_engine/map_hit_engine_widget.dart';
import 'package:vamos_cartographie/map/presentation/map_wt_ctrl.dart';
import 'map_bottom_sheet.dart';
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
          MapElementEngineWidget(
            tripId: tripId,
            child: MapWithControls(tripId: tripId),
          ),
          MapTopBar(tripId: tripId),
          MapBottomSheet(tripId: tripId),
        ],
      ),
    );
  }
}
