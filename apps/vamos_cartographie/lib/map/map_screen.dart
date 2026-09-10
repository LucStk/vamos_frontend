// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/map_data_loader.dart';
import 'package:vamos_cartographie/map/map_input/map_gesture_bridge.dart';
import '/map/overlay_ui/overlay_ui.dart';

class MapScreen extends ConsumerWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const MapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Déclenche et observe le chargement en arrière-plan
    final loader = ref.watch(tripDetailsLoaderProvider(tripId));

    return Scaffold(
      body: Stack(
        children: [
          // 1. La carte s'affiche immédiatement et charge ses tuiles
          MapGestureBridge(tripId: tripId),

          // 2. Indicateur de chargement discret pour les données métiers
          if (loader.isLoading)
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(),
            ),

          // 3. UI d'overlay
          MapTopBar(tripId: tripId),
          PopUpOverlay(tripId: tripId),
          MapBottomSheet(tripId: tripId),
        ],
      ),
    );
  }
}
