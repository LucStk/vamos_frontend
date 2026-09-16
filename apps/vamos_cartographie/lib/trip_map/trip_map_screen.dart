// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_screen.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/trip_map/injection/map_camera_provider.dart';
import 'package:vamos_cartographie/trip_map/trip_map.dart';
import 'package:vamos_cartographie/trip_map/trip_map_action_resolver/trip_map_action_resolver.dart';

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

class TripMapScreen extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const TripMapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  ConsumerState<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends ConsumerState<TripMapScreen> {
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  @override
  void dispose() {
    _panAllowed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapScreen(
            actionResolver: TripMapGestureActionResolver(),
            mapCameraReader: ref.read(mapCameraReaderProvider),
            mapController: ref.read(mapControllerProvider),
            sceneReader: RiverpodGestureSceneReader(ref, widget.tripId),
            sceneProvider: mapSceneProvider(widget.tripId),
          ),
          Consumer(
            builder: (context, ref, _) {
              final loader = ref.watch(
                tripDetailsLoaderProvider(widget.tripId),
              );
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
