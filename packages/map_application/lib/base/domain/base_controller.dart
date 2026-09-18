import 'package:map_engine/controller/domain/domain.dart';
import 'package:map_engine/visual/domain/map_camera.dart';

abstract class BaseController {
  const BaseController({required this.camera});
  final MapCameraController camera;
  void dispatchGesture(MapGesture gesture);
}
