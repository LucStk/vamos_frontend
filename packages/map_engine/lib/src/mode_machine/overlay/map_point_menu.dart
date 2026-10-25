// segment_select_mode.dart (ou son dossier)
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/slots/selection_slot.dart';
import 'package:map_engine/src/mode_machine/command/waypoint_command.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/menu_anchor.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

import 'package:trip_application/trip_application.dart';

class MapPointMenu extends ContextMenuOverlay<AppMode> {
  final WorldOffset at;
  final TripId tripId;
  MapPointMenu({required this.tripId, required this.at});
  @override
  MenuAnchor get anchor => GeoAnchor(at);

  Transition<AppMode> createVertex() => Transition.run(
    CreateWaypoint(tripId: tripId, position: at),
    then: (current, WaypointId id) {
      final editor = current.modeAs<TripActiveMode>();
      if (editor == null) return null;
      return Transition.set(
        selectionSlot,
        MapWaypoint(tripId: editor.tripId, id: id),
      );
    },
  );
}
