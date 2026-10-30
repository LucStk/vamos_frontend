import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';

typedef Layer = List<SceneItem> Function(Ref ref, MapCameraController cam);
