// segment_select_mode.dart (ou son dossier)
import 'package:map_engine/src/domain/map_anchor.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:trip_application/trip_application.dart';

final class SetOriginMenu extends MapObjectMenu<TripOriginMapAnchor> {
  SetOriginMenu(super.anchor);
}

final class TripOriginMenu extends MapObjectMenu<TripOriginMapAnchor> {
  TripOriginMenu(super.anchor);
}
