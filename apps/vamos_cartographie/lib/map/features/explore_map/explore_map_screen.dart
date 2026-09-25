// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/map.dart';
import '/domain_features/domain_features.dart';

@Dependencies([
  mapController,
  mapGestureHandler,
  MapExplore,
  MapCameraChanges,
  mapCameraSnapshot,
  mapContext,
  cameraDirector,
  userLocationTrigger,
  tripBoundsTrigger,
])
class ExploreMapScreen extends ConsumerWidget {
  const ExploreMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [],
      child: Scaffold(
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
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  onProfile: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ProfilePage()),
                    );
                  },
                ),
              ),
            ),

            Consumer(
              builder: (context, ref, _) {
                final loader = ref.watch(loadTripsProvider);

                if (!loader.isLoading) {
                  return const SizedBox.shrink();
                }

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
      ),
    );
  }
}
