// segment_select_mode.dart (ou son dossier)
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/menu_anchor.dart';

final class VertexMenu extends MapObjectMenu<MapVertex> {
  VertexMenu(super.object);
  @override
  MenuAnchor get anchor => VertexAnchor(object);
}
