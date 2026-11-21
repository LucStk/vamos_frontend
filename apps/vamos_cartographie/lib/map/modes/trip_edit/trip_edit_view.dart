// trip_edit/trip_edit_view.dart
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/trip_edit_ui.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

ModeView tripEditView(TripMode mode, SceneSpec scene) =>
    ModeView(scene: scene, ui: () => TripEditUi(mode));
