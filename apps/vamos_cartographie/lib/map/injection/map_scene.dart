import 'package:map_canvas/map_canvas.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_scene.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
MapScene mapScene(Ref ref) =>
    throw StateError('mapCamera doit être fourni par un MapScope');
