// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/base_map/base_map.dart';
import 'package:vamos_cartographie/base_map/base_map_screen.dart';
import 'package:vamos_cartographie/explore_map/injection/injection.dart';
import 'package:vamos_cartographie/explore_map/trips_carousel/trips_carousel_widget.dart';
import 'package:vamos_cartographie/trip/injection/injection.dart';

class ExploreMapScreen extends ConsumerWidget {
  const ExploreMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          BaseMap(
            controller: ref.watch(baseControllerProvider),
            sceneProvider: exploreSceneProvider,
            overlayChildren: [TripsCarouselWidget()],
          ),
          Consumer(
            builder: (context, ref, _) {
              final loader = ref.watch(loadTripsProvider);

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
