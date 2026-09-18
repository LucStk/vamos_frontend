import 'package:map_application/base/base.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/base_map/base_map.dart';
part 'base_controller.g.dart';

@Riverpod(keepAlive: true)
class BaseModeNotifier extends _$BaseModeNotifier {
  @override
  BaseMode build() => const BaseMode();

  // Utiliser une méthode classique
  void setMode(BaseMode mode) {
    state = mode;
  }
}

@Riverpod(keepAlive: true)
BaseController baseController(Ref ref) {
  return BaseController(
    camera: ref.read(mapCameraHolderProvider),
    initialMode: const BaseMode(),
    // Appel d'une méthode standard
    onModeChanged: (mode) => ref.read(baseModeProvider.notifier).setMode(mode),
  );
}
