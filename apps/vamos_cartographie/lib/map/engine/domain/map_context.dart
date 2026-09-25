import 'package:map_canvas/domain/domain.dart';
import 'package:vamos_cartographie/map/camera/application/flutter_map_camera.dart';

class MapContext {
  const MapContext({required this.camera, required this.scene});

  final FlutterMapCamera camera;
  final MapScene scene;
}
