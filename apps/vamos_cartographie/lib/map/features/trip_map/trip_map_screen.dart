import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';

import '../../../domain_features/auth/providers/auth_providers.dart';
import '../../../domain_features/trip/injection/trip_data_loader.dart';
import '../../../domain_features/trip/injection/trip_store.dart';
import '../../camera/application/map_camera_lifecycle.dart';
import '../../camera/domain/camera_vision.dart';
import '../../camera/injection/camera_or_null.dart';
import '../../camera/injection/map_camera_provider.dart';
import '../../camera/injection/user_location_trigger.dart';
import '../../injection/map_mode.dart';
import '../../injection/map_scene.dart';
import '../../presentation/base_map_screen.dart';
import 'presentation/bottom_sheet/map_bottom_sheet.dart';
import 'presentation/map_top_bar.dart';

@Dependencies([mapScene])
class TripMapScreen extends StatefulWidget {
  const TripMapScreen({super.key, required this.tripId, this.initialVision});
  final TripId tripId;
  final CameraVision? initialVision;

  @override
  State<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends State<TripMapScreen>
    with TickerProviderStateMixin, MapCameraLifecycle {
  @override
  CameraVision? get initialVision => widget.initialVision;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        mapCameraProvider.overrideWithValue(camera),
        cameraOrNullProvider.overrideWith(CameraOrNull.new),
      ],
      child: _TripMapResolver(tripId: widget.tripId),
    );
  }
}

@Dependencies([CameraOrNull, mapCamera])
class _TripMapResolver extends ConsumerWidget {
  const _TripMapResolver({required this.tripId});
  final TripId tripId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ mapCameraProvider et cameraOrNullProvider déjà overridés
    // par le MapCameraScope parent (dans ExploreMapScreen), pas besoin
    // d'un second scope ici.
    final tripOwnerId = ref.watch(
      tripRequiredProvider(tripId).select((s) => s.ownerId),
    );
    final isOwner = ref.watch(currentUserIdProvider) == tripOwnerId.value;

    // final controller = isOwner ? ref.watch(mapEditorProvider(tripId).notifier) :
    final controller = ref.watch(mapEditorProvider(tripId).notifier);
    return ProviderScope(
      overrides: [
        mapSceneProvider.overrideWith(
          (ref) => ref.watch(tripEditorSceneProvider(tripId)),
        ),
        mapModeProvider.overrideWith(
          (ref) => ref.watch(mapEditorProvider(tripId)),
        ),
        mapControllerProvider.overrideWithValue(controller.controller),
      ],
      child: _TripMapView(tripId: tripId, isOwner: true),
    );
  }
}

@Dependencies([CameraOrNull, mapScene, mapCamera, userLocationTrigger])
class _TripMapView extends ConsumerWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const _TripMapView({required this.tripId, required this.isOwner});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(tripDetailsLoaderProvider(tripId));

    return Scaffold(
      body: Stack(
        children: [
          BaseMap(
            cameraTriggers: [userLocationTriggerProvider],
            overlayChildren: [
              MapTopBar(tripId: tripId),
              MapEditorBottomSheet(tripId: tripId),
            ],
          ),

          if (loader.isLoading)
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
