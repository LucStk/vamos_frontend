import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_application/map_application.dart';

class MapSceneLayer extends StatelessWidget {
  const MapSceneLayer({super.key, required this.scene});

  final MapScene scene;

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);

    return CustomPaint(
      painter: MapScenePainter(scene: scene, camera: camera),
      size: Size.infinite,
    );
  }
}
