import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/map/camera/camera_vision.dart';
import 'package:vamos_cartographie/map/camera/flutter_map_camera.dart';

/// Mutualise la création de la caméra et son cycle de vie d'animation.
/// Ne touche pas au ProviderScope : chaque écran doit toujours l'écrire
/// lui-même pour que `riverpod_lint` reconnaisse l'override localement.
mixin MapCameraLifecycle<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  CameraVision? get initialVision => null;

  late final FlutterMapCamera camera = FlutterMapCamera(
    MapController(),
    initialVision: initialVision,
  );

  @override
  void initState() {
    super.initState();
    camera.attachAnimatedController(this);
  }

  @override
  void dispose() {
    camera
        .dispose(); // annule l'abonnement, détache l'animation, libère les notifiers
    super.dispose();
  }
}
