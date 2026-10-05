import 'package:map_controllers/map_controllers.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/application/base_mode_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/map.dart';
part 'map_context_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
FlutterMapCamera mapCamera(Ref ref) =>
    throw StateError('mapCamera doit être fourni par un MapScope');

@Riverpod(keepAlive: true, dependencies: [])
MapScene mapScene(Ref ref) =>
    throw StateError('mapCamera doit être fourni par un MapScope');

@Riverpod(keepAlive: true, dependencies: [])
BaseMode mapMode(Ref ref) =>
    throw StateError('mapMode doit être fourni par un MapScope');
