// segment_select_mode.dart (ou son dossier)
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/selection.dart';
import 'package:map_engine/src/mode_machine/command/vertex_command.dart';
import 'package:map_engine/src/mode_machine/app_mode.dart';
import 'package:map_engine/src/mode_machine/mode_state.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu_overlay.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

final class IdleMenu extends ContextMenuOverlay<AppMode> {
  const IdleMenu(super.at);

  Transition<AppMode> createVertex() => Transition.run(
    CreateSimpleVertex(at),
    then: (current, VertexId id) {
      final editor = current.modeAs<IdleEditor>();
      if (editor == null) return null;
      return Transition.set(
        selectionSlot,
        MapVertex(tripId: editor.tripId, id: id),
      );
    },
  );
}
