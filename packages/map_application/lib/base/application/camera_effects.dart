import 'package:map_application/base/domain/base_controller.dart';
import 'package:map_engine/visual/domain/offset_type.dart';

extension ZoomToEffect on BaseController {
  Future<void> zoomTo(WorldOffset offset) async {
    final latLng = camera.worldOffsetToLatLng(offset);
    camera.zoomTo(latLng);
  }
}
