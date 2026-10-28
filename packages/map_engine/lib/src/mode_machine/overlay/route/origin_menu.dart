// segment_select_mode.dart (ou son dossier)
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/menu_anchor.dart';
import 'package:trip_application/trip_application.dart';

final class SetOriginMenu extends MapObjectMenu<MapTmpOrigin> {
  SetOriginMenu() : super(MapTmpOrigin());
  @override
  MenuAnchor get anchor => TripOriginAnchor(object);
}

final class TripOriginMenu extends MapObjectMenu<MapTripOrigin> {
  TripOriginMenu(this.tripId) : super(MapTripOrigin(tripId));
  final TripId tripId;

  @override
  MenuAnchor get anchor => TripOriginAnchor(object);
}
