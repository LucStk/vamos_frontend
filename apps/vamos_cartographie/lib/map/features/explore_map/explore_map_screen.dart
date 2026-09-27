// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/map.dart';
import '/domain_features/domain_features.dart';

@Dependencies([MapEditor, MapExplore])
class ExploreMapScreen extends StatefulWidget {
  const ExploreMapScreen({super.key});

  @override
  State<ExploreMapScreen> createState() => _MapExploreScreenState();
}

class _MapExploreScreenState extends State<ExploreMapScreen>
    with TickerProviderStateMixin {
  late final _camera = FlutterMapCamera(MapController());

  @override
  void initState() {
    super.initState();
    _camera.attachAnimatedController(this);
  }

  @override
  void dispose() {
    _camera.detachAnimatedController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        mapCameraProvider.overrideWithValue(_camera),
        cameraOrNullProvider.overrideWith(CameraOrNull.new),
      ],
      child: _ExploreSceneResolver(),
    );
  }
}

@Dependencies([
  CameraOrNull,
  MapExplore,
  userLocationTrigger,
  tripBoundsTrigger,
  cameraDirector,
  mapCamera,
])
class _ExploreSceneResolver extends ConsumerWidget {
  const _ExploreSceneResolver();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ mapCameraProvider et cameraOrNullProvider déjà overridés
    // par le MapCameraScope parent (dans ExploreMapScreen), pas besoin
    // d'un second scope ici.
    final controller = ref.watch(mapExploreProvider.notifier);
    return ProviderScope(
      overrides: [
        mapSceneProvider.overrideWith((ref) => ref.watch(exploreSceneProvider)),
        mapControllerProvider.overrideWithValue(controller.controller),
      ],
      child: const _ExploreMapView(),
    );
  }
}

@Dependencies([
  CameraOrNull,
  mapScene,
  mapController,
  cameraDirector,
  mapCamera,
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
            overlayChildren: [],
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
                  // const LoginRoute().push(context);
                },
                onProfile: () {
                  // const ProfileRoute().push(context);
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
