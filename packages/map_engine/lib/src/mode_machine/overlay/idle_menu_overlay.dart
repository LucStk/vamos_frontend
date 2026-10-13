// segment_select_mode.dart (ou son dossier)
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/selection.dart';
import 'package:map_engine/src/mode_machine/command/vertex_command.dart';
import 'package:map_engine/src/mode_machine/modes/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu_overlay.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

final class IdleMenu extends ContextMenuOverlay<TripEditMode> {
  const IdleMenu(super.at);

  Transition<TripEditMode> createVertex() => Transition.run(
    CreateSimpleVertex(at),
    then: (current, VertexId id) => current is IdleEditor
        ? Transition.set(selectionSlot, MapVertex(id))
        : null,
  );
}
