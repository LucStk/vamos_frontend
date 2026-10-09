import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';

import '/domain_features/auth/providers/auth_providers.dart';
import '/domain_features/trip/injection/trip_data_loader.dart';
import '/domain_features/trip/injection/trip_store.dart';

import '/map/camera/application/map_camera_lifecycle.dart';
import '/map/camera/domain/camera_vision.dart';
import '/map/camera/injection/camera_or_null.dart';
import '/map/camera/injection/map_camera_provider.dart';
import '/map/camera/injection/user_location_trigger.dart';
import "/map/camera/injection/camera_director_provider.dart";

import "/map/injection/map_gesture_handler.dart";
import '/map/injection/map_mode.dart';
import '/map/injection/map_scene.dart';
import '../../presentation/base_map_screen.dart';
import 'injection/map_editor_mode.dart';
import 'injection/trip_editor_scene.dart';
import 'injection/trip_view_mode.dart';
import 'presentation/bottom_sheet/map_bottom_sheet.dart';
import 'presentation/context_menu/context_menu_roundabout.dart';
import 'presentation/map_top_bar.dart';

@Dependencies([MapGestureHandlerNotifier])
class TripMapScreen extends StatefulWidget {
  const TripMapScreen({super.key, required this.tripId, this.initialVision});
  final TripId tripId;
  final CameraVision? initialVision;

  @override
  State<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends State<TripMapScreen>
    with TickerProviderStateMixin, MapCameraLifecycle {
  @override
  CameraVision? get initialVision => widget.initialVision;

  @override
  Widget build(BuildContext context) {
    print("trip_map_screen rebuild");
    return ProviderScope(
      overrides: [
        mapCameraProvider.overrideWithValue(camera),
        cameraOrNullProvider.overrideWith(CameraOrNull.new),
      ],
      child: _TripMapResolver(tripId: widget.tripId),
    );
  }
}

@Dependencies([
  TripViewer,
  CameraOrNull,
  mapCamera,
  MapEditor,
  cameraDirector,
  userLocationTrigger,
  MapGestureHandlerNotifier,
])
class _TripMapResolver extends ConsumerWidget {
  const _TripMapResolver({required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripOwnerId = ref.watch(
      tripRequiredProvider(tripId).select((s) => s.ownerId),
    );
    final isOwner = ref.watch(currentUserIdProvider) == tripOwnerId.value;

    // `.notifier` ne notifie jamais : pas de rebuild sur changement d'état.
    final ModeHost controller = isOwner
        ? ref.watch(mapEditorProvider(tripId).notifier)
        : ref.watch(tripViewerProvider(tripId).notifier);

    return ProviderScope(
      // Un autre controller = un autre scope. isOwner change quasiment jamais.
      key: ValueKey(isOwner),
      overrides: [
        mapModeProvider.overrideWith(
          (ref) => isOwner
              ? ref.watch(mapEditorProvider(tripId).select((s) => s.mode))
              : ref.watch(tripViewerProvider(tripId).select((s) => s.mode)),
        ),
        modeOverlayProvider.overrideWith(
          (ref) => isOwner
              ? ref.watch(mapEditorProvider(tripId).select((s) => s.overlay))
              : ref.watch(tripViewerProvider(tripId).select((s) => s.overlay)),
        ),
        modeContextProvider.overrideWith(
          (ref) => isOwner
              ? ref.watch(mapEditorProvider(tripId).select((s) => s.context))
              : ref.watch(tripViewerProvider(tripId).select((s) => s.context)),
        ),
        mapSceneProvider.overrideWith(
          (ref) => ref.watch(tripEditorSceneProvider(tripId)),
        ),
        mapModeControllerProvider.overrideWithValue(controller),
      ],
      child: _TripMapView(tripId: tripId, isOwner: isOwner),
    );
  }
}

@Dependencies([
  modeOverlay,
  CameraOrNull,
  mapCamera,
  MapEditor,
  cameraDirector,
  userLocationTrigger,
  mapScene,
  MapGestureHandlerNotifier,
])
class _TripMapView extends ConsumerWidget {
  final TripId tripId;
  final bool isOwner;

  const _TripMapView({required this.tripId, required this.isOwner});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("trip_map_view rebuild");
    final loader = ref.watch(tripDetailsLoaderProvider(tripId));

    return Scaffold(
      body: Stack(
        children: [
          BaseMap(
            cameraTriggers: [userLocationTriggerProvider],
            overlayChildren: [
              MapTopBar(tripId: tripId),
              MapEditorBottomSheet(tripId: tripId),
              ContextMenuRoundabout(tripId: tripId),
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
