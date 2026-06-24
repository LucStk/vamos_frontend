// waypoint_ui_extension.dart — vamos_cartographie
import "package:domain_core/domain_core.dart";
import "package:trip_domain/domain/entities/waypoint.dart";
import "package:vamos_cartographie/features/waypoint/domain/poi_ui.dart";
export "package:trip_domain/domain/entities/waypoint.dart";

typedef WaypointUiId = Id<WaypointUi>;

extension type WaypointUi(Waypoint _waypoint) implements Waypoint {
  // Votre propriété UI ajoutée
  WaypointUiId get id => (_waypoint.id as WaypointUiId);
  PoiCategoryUi get poiCategoryUi => PoiCategoryUi.from(poiCategory);
}
