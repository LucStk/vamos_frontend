import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/map.dart';

@Dependencies([MapEditor, tripEditorScene])
class TripMapScreen extends ConsumerWidget {
  final Id<Trip> tripId;
  final bool isOwner;

  const TripMapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scene = ref.watch(tripEditorSceneProvider(tripId));
    final controller = ref.watch(mapEditorProvider(tripId).notifier);

    return ProviderScope(
      overrides: [
        mapContextProvider.overrideWithValue(
          MapContext(camera: FlutterMapCamera(MapController()), scene: scene),
        ),
        mapControllerProvider.overrideWithValue(controller.controller),
      ],
      child: _TripMapView(tripId: tripId, isOwner: isOwner),
    );
  }
}

@Dependencies([
  mapController,
  mapGestureHandler,
  cameraDirector,
  mapContext,
  MapCameraChanges,
  mapCameraSnapshot,
  MapEditor,
])
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
          BaseMap(overlayChildren: [MapEditorBottomSheet(tripId: tripId)]),

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
