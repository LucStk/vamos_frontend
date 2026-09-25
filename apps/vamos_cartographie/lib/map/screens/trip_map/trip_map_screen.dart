// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/camera/camera.dart';
import 'package:vamos_cartographie/map/screens/base_map/base_map.dart';
import 'package:vamos_cartographie/map/screens/trip_map/presentation/overlay_editor/overlay_editor.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'injection/injection.dart';

@Dependencies([
  tripEditorScene,
  mapEditorController,
  // userLocationTrigger,
  cameraDirector,
  mapController,
  MapCameraHolder,
  MapCameraChanges,
  mapCameraSnapshot,
])
class TripMapScreen extends StatelessWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const TripMapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BaseMap(
            controllerProvider: mapEditorControllerProvider(tripId),
            sceneProvider: tripEditorSceneProvider(tripId),
            overlayChildren: [MapEditorBottomSheet(tripId: tripId)],
          ),
          Consumer(
            builder: (context, ref, _) {
              final loader = ref.watch(tripDetailsLoaderProvider(tripId));
              if (!loader.isLoading) return const SizedBox.shrink();
              return const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
