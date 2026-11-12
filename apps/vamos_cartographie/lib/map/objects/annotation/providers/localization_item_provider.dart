import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/app_services/user_location/user_location_provider.dart';
import 'package:vamos_cartographie/app_services/user_location/user_location_domain.dart';
import 'package:vamos_cartographie/map/objects/annotation/localization_item.dart';

part 'localization_item_provider.g.dart';

@Riverpod(keepAlive: true)
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
