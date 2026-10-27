// segment_select_mode.dart (ou son dossier)
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/sketch_edition_mode.dart';

import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/menu_anchor.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

final class SectionMenu extends MapObjectMenu<MapSection> {
  SectionMenu({required this.tripId, required this.sectionId, required this.at})
    : super(MapSection(tripId: tripId, id: sectionId));
  final TripId tripId;
  final SectionId sectionId;
  final WorldOffset at;

  @override
  MenuAnchor get anchor => SectionAnchor(object, at);

  Transition<AppMode> extend(WorldOffset from) =>
      SketchEdition.start(tripId, from);
}
