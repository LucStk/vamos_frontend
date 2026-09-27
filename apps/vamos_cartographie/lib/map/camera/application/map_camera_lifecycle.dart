import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/map/map.dart';

/// Mutualise la création de la caméra et son cycle de vie d'animation.
/// Ne touche pas au ProviderScope : chaque écran doit toujours l'écrire
/// lui-même pour que `riverpod_lint` reconnaisse l'override localement.
mixin MapCameraLifecycle<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  /// À surcharger dans la classe qui utilise le mixin si l'écran doit
  /// démarrer sur une zone précise plutôt que sur la position par défaut.
  CameraVision? get initialVision => null;

  late final FlutterMapCamera camera = FlutterMapCamera(MapController());

  @override
  void initState() {
    super.initState();
    camera.attachAnimatedController(this);

    final vision = initialVision;
    if (vision != null) {
      // Le MapController de flutter_map n'est utilisable qu'une fois attaché
      // au widget FlutterMap → on applique après le premier frame.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          camera.fitBounds(
            vision.bounds,
          ); // ⚠️ adapte le nom de la méthode (fitBounds / moveToBounds / jumpToBounds…)
        }
      });
    }
  }

  @override
  void dispose() {
    camera.detachAnimatedController();
    super.dispose();
  }
}
