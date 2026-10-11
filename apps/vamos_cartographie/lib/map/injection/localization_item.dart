import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:map_engine/map_engine.dart';
import '../canvas/domain/scene_item/localization_item.dart';
import '/app_services/app_services.dart';
part "localization_item.g.dart";

@Riverpod(keepAlive: true, dependencies: [])
LocalizationItem? localizationItem(Ref ref, MapCameraReader camera) {
  final location = ref.watch(userLocationProvider);

  if (location case final UserPositionActive activeLocation) {
    return LocalizationItem(
      object: MapLocalization(
        accuracy: activeLocation.accuracy,
        heading: activeLocation.heading,
      ),
      worldPosition: camera.latLngToWorldOffset(activeLocation.position),
    );
  }
  return null;
}
