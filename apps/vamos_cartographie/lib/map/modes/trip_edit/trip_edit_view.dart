import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/trip_edit_ui.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

/// Vue d'un mode de la famille « édition du trip ».
///
/// Tous les modes de la famille renvoient la MÊME UI ([TripEditUi]) : Flutter
/// garde donc la boîte à outils d'un mode à l'autre (pas de recréation, les
/// animations continuent). Seule la scène change, propre à chaque mode.
ModeView tripEditView(TripMode mode, SceneSpec scene) =>
    ModeView(scene: scene, ui: () => TripEditUi(mode));
