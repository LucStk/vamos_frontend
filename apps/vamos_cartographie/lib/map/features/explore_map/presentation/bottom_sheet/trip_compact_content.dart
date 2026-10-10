// Emplacement : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';

import '../../../../camera/domain/camera_vision.dart';
import '../../../../camera/injection/map_camera_provider.dart';
import '/domain_features/stored_file/presentation/carousel_view.dart';
import '/routing/routing.dart';
import "/map/injection/map_gesture_handler.dart";
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([MapGestureHandlerNotifier, mapCamera])
class TripCompactContent extends ConsumerWidget {
  final Trip trip;
  const TripCompactContent({super.key, required this.trip});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Coupe l'excédent visuel sans jamais permettre de scroller.
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          ImageCarouselView(id: trip.id),
          const Spacer(),
          FilledButton.icon(
            onPressed: () {
              final cameraFit = ref.read(mapCameraProvider).visibleBounds;
              TripRoute(
                tripId: trip.id.value,
                $extra: CameraVision(bounds: cameraFit),
              ).go(context);
            },
            icon: const Icon(Icons.map_sharp, size: 16),
            label: const Text('Ouvrir'),
          ),
        ],
      ),
    );
  }
}
