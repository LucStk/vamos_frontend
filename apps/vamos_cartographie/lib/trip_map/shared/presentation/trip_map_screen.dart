// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/base_map/base_map_screen.dart';

class RiverpodGestureSceneReader implements GestureSceneReader {
  const RiverpodGestureSceneReader(this.ref, this.tripId);

  final WidgetRef ref;
  final TripId tripId;

  @override
  ProjectedScene get scene => ref.read(projectedSceneProvider(tripId));
}

class RiverpodGestureScenePainter implements GestureSceneReader {
  const RiverpodGestureScenePainter(this.ref, this.tripId);

  final WidgetRef ref;
  final TripId tripId;

  @override
  ProjectedScene get scene => ref.read(projectedSceneProvider(tripId));
}

class TripMapScreen extends ConsumerWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const TripMapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          BaseMap(
            onGesture: ,
            sceneReader: RiverpodGestureSceneReader(ref, tripId),
            sceneProvider: mapSceneProvider(tripId),
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
