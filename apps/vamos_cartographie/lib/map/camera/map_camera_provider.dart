import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/flutter_map_camera.dart';
part 'map_camera_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
FlutterMapCamera mapCamera(Ref ref) =>
    throw StateError('mapCamera doit être fourni par un MapScope');
