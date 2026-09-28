// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/map.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';
import '/domain_features/domain_features.dart';

@Dependencies([MapEditor, MapExplore])
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

@Dependencies([
  CameraOrNull,
  MapEditor,
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
  MapExplore,
  MapEditor,
  CameraOrNull,
  mapScene,
  mapController,
  cameraDirector,
  mapCamera,
  userLocationTrigger,
  tripBoundsTrigger,
])
class _ExploreMapView extends ConsumerStatefulWidget {
  const _ExploreMapView();

  @override
  ConsumerState<_ExploreMapView> createState() => _ExploreMapViewState();
}

class _ExploreMapViewState extends ConsumerState<_ExploreMapView> {
  static const double _desktopBreakpoint = 700.0;

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(loadTripsProvider);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= _desktopBreakpoint;

          if (!isDesktop) {
            return Stack(
              children: [
                BaseMap(
                  cameraTriggers: [
                    userLocationTriggerProvider,
                    tripBoundsTriggerProvider,
                  ],
                  overlayChildren: const [TripsCarouselWidget()],
                ),

                Positioned(
                  top: 16,
                  right: 16,
                  child: _buildProfileButton(context),
                ),

                if (loader.isLoading)
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(),
                  ),
              ],
            );
          }

          return Row(
            children: [
              const PanelLateral(child: TripsCarouselWidget()),

              Expanded(
                child: Stack(
                  children: [
                    BaseMap(
                      cameraTriggers: [
                        userLocationTriggerProvider,
                        tripBoundsTriggerProvider,
                      ],
                      overlayChildren: const [],
                    ),

                    Positioned(
                      top: 16,
                      right: 72,
                      child: _buildCreateTripButton(context),
                    ),

                    Positioned(
                      top: 16,
                      right: 16,
                      child: _buildProfileButton(context),
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
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileButton(BuildContext context) {
    return Material(
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
    );
  }
}

Widget _buildCreateTripButton(BuildContext context) {
  return Material(
    elevation: 4,
    color: Theme.of(context).colorScheme.surface,
    shape: const CircleBorder(),
    clipBehavior: Clip.antiAlias,
    child: IconButton(
      icon: const Icon(Icons.add),
      tooltip: 'Créer un voyage',
      onPressed: () {
        // _createAndOpenTrip();
      },
    ),
  );
}

Future<void> _createAndOpenTrip(BuildContext context, WidgetRef ref) async {
  final result = await ref.read(tripStoreProvider.notifier).createBlankTrip();

  result.fold(
    (failure) {
      // rien à faire ici : ErrorHandler/notificationQueueProvider
      // a déjà affiché la notification globale via OptimisticExecutor
    },
    (trip) {
      if (!context.mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) =>
            TripFormDialog(initialTrip: trip, successMessage: 'Voyage créé'),
      );
    },
  );
}
