import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_application/map_application.dart';
import 'package:map_explore_application/map_explore_mode.dart';

final class MapExploreController extends BaseController<MapExploreMode> {
  MapExploreController({required super.camera, required super.onModeChanged})
    : super(initialMode: const MapExploreMode());

  // final MapEffectQueue _effectQueue = MapEffectQueue();

  // --- Exécution des commandes émises par les handlers ---

  @override
  @protected
  void onCommand(MapCommand command) {
    // _effectQueue.add(() async {
    //   final _ = await _commandResolver.resolve(command);
    //   // // `mode` est lu ICI, après l'await : c'est le mode réel du moment.
    //   // final updated = modeAfter(mode, result);
    //   // if (updated != null) mode = updated;
    // });
  }
}
