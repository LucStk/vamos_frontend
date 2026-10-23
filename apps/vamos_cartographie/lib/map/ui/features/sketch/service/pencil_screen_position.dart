import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/scene/layers/edit_trip/sketch/pencil_item_provider.dart';

@Dependencies([pencilItem])
ScreenOffset? pencilScreenPosition(WidgetRef ref, MapCameraController camera) {
  final pencil = ref.read(pencilItemProvider(camera));
  final worldPosition = pencil?.worldPosition;

  if (worldPosition == null) {
    return null;
  }

  return camera.worldToScreen(worldPosition);
}
