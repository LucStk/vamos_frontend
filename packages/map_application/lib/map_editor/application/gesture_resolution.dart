import 'package:map_application/map_application.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';

class GestureResolution {
  const GestureResolution({required this.mapEditorState});
  final MapEditorMode mapEditorState;

  void resolve(MapGesture gesture) {
    switch (gesture) {
      case TapGesture(:final element):
      case _:
    }
  }
}
