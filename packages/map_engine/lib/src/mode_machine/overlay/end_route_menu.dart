// segment_select_mode.dart (ou son dossier)
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/sketch_edition_mode.dart';

import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/menu_anchor.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

final class TripEndMenu extends MapObjectMenu<MapTripEnd> {
  TripEndMenu(this.tripId) : super(MapTripEnd(tripId));
  final TripId tripId;

  @override
  MenuAnchor get anchor => TripEndAnchor(object);

  Transition<AppMode> extend(WorldOffset from) =>
      SketchEdition.start(tripId, from);
}
