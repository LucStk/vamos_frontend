// waypoint_ui_extension.dart — vamos_cartographie
import "package:trip_domain/domain/entities/waypoint.dart";
import "package:vamos_cartographie/features/waypoint/domain/poi_ui.dart";
export "package:trip_domain/domain/entities/waypoint.dart";

extension type WaypointUi(Waypoint _waypoint) implements Waypoint {
  // Votre propriété UI ajoutée
  PoiCategoryUi get poiCategoryUi => PoiCategoryUi.from(poiCategory);
}
