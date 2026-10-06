// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import '../../camera/application/map_camera_lifecycle.dart';
import '../../camera/injection/camera_or_null.dart';
import '../../camera/injection/map_camera_provider.dart';
import '../../camera/injection/user_location_trigger.dart';
import '../../injection/map_mode.dart';
import '../../injection/map_scene.dart';
import '../../presentation/base_map_screen.dart';
import '/domain_features/domain_features.dart';
import 'injection/trip_bounds_trigger.dart';
import 'presentation/explore_bottom_sheet.dart';
import 'presentation/trips_carousel_widget.dart';

@Dependencies([])
class ExploreMapScreen extends StatefulWidget {
  const ExploreMapScreen({super.key});

  @override
  State<ExploreMapScreen> createState() => _MapExploreScreenState();
}

class _MapExploreScreenState extends State<ExploreMapScreen>
    with TickerProviderStateMixin, MapCameraLifecycle {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        mapCameraProvider.overrideWithValue(camera),
        cameraOrNullProvider.overrideWith(CameraOrNull.new),
      ],
      child: const _ExploreSceneResolver(),
    );
  }
}

@Dependencies([CameraOrNull, userLocationTrigger, tripBoundsTrigger, mapCamera])
class _ExploreSceneResolver extends ConsumerWidget {
  const _ExploreSceneResolver();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mapExploreProvider.notifier);
    return ProviderScope(
      overrides: [
        mapSceneProvider.overrideWith((ref) => ref.watch(exploreSceneProvider)),
        mapModeProvider.overrideWith((ref) => ref.watch(mapExploreProvider)),
        mapControllerProvider.overrideWithValue(controller.controller),
      ],
      child: const _ExploreMapView(),
    );
  }
}

@Dependencies([CameraOrNull, mapCamera, userLocationTrigger, tripBoundsTrigger])
class _ExploreMapView extends ConsumerStatefulWidget {
  const _ExploreMapView();

  @override
  ConsumerState<_ExploreMapView> createState() => _ExploreMapViewState();
}

class _ExploreMapViewState extends ConsumerState<_ExploreMapView> {
  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(loadTripsProvider);

    return Scaffold(
      body: Stack(
        children: [
          BaseMap(
            cameraTriggers: [
              userLocationTriggerProvider,
              tripBoundsTriggerProvider,
            ],
            overlayChildren: const [
              TripsCarouselWidget(),
              ExploreBottomSheet(),
            ],
          ),

          Positioned(top: 16, right: 16, child: AccountButton()),

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
