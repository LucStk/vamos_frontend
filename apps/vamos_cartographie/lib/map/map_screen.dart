// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_data_loader.dart';
import 'package:vamos_cartographie/map/camera/map_camera_lifecycle.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/map_gesture_bridge.dart';
import 'package:vamos_cartographie/map/layers/layers.dart';
import 'package:vamos_cartographie/map/engine/map_gesture_handler.dart';

import 'package:vamos_cartographie/map/scene/map_scene.dart';
import 'package:vamos_cartographie/map/ui/chrome/right_control_panel.dart';
import 'package:vamos_cartographie/map/modes/mode_ui.dart';

@Dependencies([mapScene, MapGestureHandlerNotifier, mapCamera, cameraDirector])
class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen>
    with TickerProviderStateMixin, MapCameraLifecycle {
  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(loadTripsProvider);
    // Adaptez à votre façon d'accéder au CameraDirector
    // (il est peut-être déjà exposé par le mixin MapCameraLifecycle).
    final director = ref.read(cameraDirectorProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          director.updateViewport(constraints.biggest);

          return Stack(
            children: [
              MapGestureBridge(),
              const MapControls(),
              const ModeUi(),

              if (loader.isLoading)
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(child: LinearProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}
