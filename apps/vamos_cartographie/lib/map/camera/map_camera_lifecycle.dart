import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/camera/flutter_map_camera.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';

/// Mutualise la création de la caméra et son cycle de vie d'animation.
/// Ne touche pas au ProviderScope : chaque écran doit toujours l'écrire
/// lui-même pour que `riverpod_lint` reconnaisse l'override localement.
mixin MapCameraLifecycle<T extends ConsumerStatefulWidget>
    on ConsumerState<T>, TickerProviderStateMixin<T> {
  late final FlutterMapCamera _camera;

  @override
  void initState() {
    super.initState();
    _camera = ref.read(mapCameraProvider);
    _camera.attachAnimatedController(this);
  }

  @override
  void dispose() {
    _camera.markDetached(); // on garde la référence : pas de ref dans dispose
    super.dispose();
  }
}
