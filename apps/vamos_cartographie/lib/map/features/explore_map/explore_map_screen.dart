// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/map.dart';
import 'package:vamos_cartographie/routing/routing.dart';
import '/domain_features/domain_features.dart';

@Dependencies([mapGestureHandler])
class ExploreMapScreen extends ConsumerWidget {
  const ExploreMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        mapCameraProvider.overrideWithValue(FlutterMapCamera(MapController())),
      ],
      // ⬇️ exploreSceneProvider est lu plus bas, DANS ce scope
      child: const _ExploreSceneResolver(),
    );
  }
}

@Dependencies([
  exploreScene,
  MapExplore,
  userLocationTrigger,
  tripBoundsTrigger,
  mapGestureHandler,
  cameraDirector,
  mapCamera,
  MapCameraChanges,
  mapCameraSnapshot,
])
class _ExploreSceneResolver extends ConsumerWidget {
  const _ExploreSceneResolver();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ ici, mapCameraProvider est déjà override dans ce sous-arbre,
    // donc projectTripProvider -> exploreSceneProvider se résolvent correctement
    final scene = ref.watch(exploreSceneProvider);

    final controller = ref.watch(mapExploreProvider.notifier);
    return ProviderScope(
      overrides: [
        mapSceneProvider.overrideWithValue(scene),
        mapControllerProvider.overrideWithValue(controller.controller),
      ],
      child: const _ExploreMapView(),
    );
  }
}

@Dependencies([
  mapScene,
  mapController,
  mapGestureHandler,
  cameraDirector,
  mapCamera,
  MapCameraChanges,
  mapCameraSnapshot,
  MapExplore,
  userLocationTrigger,
  tripBoundsTrigger,
])
class _ExploreMapView extends ConsumerWidget {
  const _ExploreMapView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(loadTripsProvider);

    return Scaffold(
      body: Stack(
        children: [
          BaseMap(
            cameraTriggers: [
              userLocationTriggerProvider,
              tripBoundsTriggerProvider,
            ],
            overlayChildren: [TripsCarouselWidget()],
          ),

          Positioned(
            top: 16,
            right: 16,
            child: Material(
              elevation: 4,
              color: Theme.of(context).colorScheme.surface,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: ProfileButton(
                onLogin: () {
                  const LoginRoute().push(context);
                },
                onProfile: () {
                  const ProfileRoute().push(context);
                },
              ),
            ),
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
