// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map_canvas/injections/map_camera_provider.dart';
import 'package:vamos_cartographie/map_canvas/map_gesture_bridge.dart';
import 'package:vamos_cartographie/map_editor/gestures_resolver/gestures_resolver.dart';
import 'package:vamos_cartographie/map_editor/map_editor.dart';

class RiverpodGestureSceneReader implements GestureSceneReader {
  const RiverpodGestureSceneReader(this.ref, this.tripId);

  final WidgetRef ref;
  final TripId tripId;

  @override
  ProjectedScene get scene => ref.read(projectedSceneProvider(tripId));
}
class RiverpodActionResolver implements GestureActionResolver {
  const RiverpodActionResolver(this.ref, this.tripId);

  final WidgetRef ref;
  final TripId tripId;

  @override
  GestureResolution resolve(PointerGestureAction? action){
    final res = action.resovle
  }
}
class MapEditorScreen extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const MapEditorScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  ConsumerState<MapEditorScreen> createState() => _MapEditorScreenState();
}

class _MapEditorScreenState extends ConsumerState<MapEditorScreen> {
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
          MapGestureBridge(
            sceneReader: RiverpodGestureSceneReader(ref,widget.tripId),
            actionResolver: /* ... */,
            panAllowed: _panAllowed,
            child: MapCanvas(
              mapController: ref.read(mapControllerProvider),
              painter: /,
              panAllowed: _panAllowed,
            ),
          ),
          Consumer(
            builder: (context, ref, _) {
              final loader = ref.watch(tripDetailsLoaderProvider(widget.tripId));
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
