import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/map.dart';

@Dependencies([MapEditor, mapScene])
class TripMapScreen extends StatefulWidget {
  const TripMapScreen({super.key, required this.tripId});
  final TripId tripId;

  @override
  State<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends State<TripMapScreen>
    with TickerProviderStateMixin, MapCameraLifecycle {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        mapCameraProvider.overrideWithValue(camera),
        cameraOrNullProvider.overrideWith(CameraOrNull.new),
      ],
      child: _TripMapResolver(tripId: widget.tripId),
    );
  }
}

@Dependencies([CameraOrNull, MapEditor, cameraDirector, mapCamera])
class _TripMapResolver extends ConsumerWidget {
  const _TripMapResolver({required this.tripId});
  final TripId tripId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ mapCameraProvider et cameraOrNullProvider déjà overridés
    // par le MapCameraScope parent (dans ExploreMapScreen), pas besoin
    // d'un second scope ici.
    final controller = ref.watch(mapEditorProvider(tripId).notifier);
    return ProviderScope(
      overrides: [
        mapSceneProvider.overrideWith(
          (ref) => ref.watch(tripEditorSceneProvider(tripId)),
        ),
        mapControllerProvider.overrideWithValue(controller.controller),
      ],
      child: _TripMapView(tripId: tripId, isOwner: true),
    );
  }
}

@Dependencies([
  CameraOrNull,
  MapEditor,
  mapScene,
  mapController,
  cameraDirector,
  mapCamera,
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
          BaseMap(
            overlayChildren: [
              MapTopBar(tripId: tripId),
              MapEditorBottomSheet(tripId: tripId),
            ],
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
