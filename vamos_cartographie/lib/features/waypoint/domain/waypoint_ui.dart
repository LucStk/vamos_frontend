// waypoint_ui_extension.dart — vamos_cartographie
import "package:trip_domain/domain/entities/waypoint.dart";
import "package:vamos_cartographie/features/shared/domain/entities/poi_ui.dart";
export "package:trip_domain/domain/entities/waypoint.dart";

extension WaypointUi on Waypoint {
  PoiCategoryUi get categoryUi => PoiCategoryUi.from(poiCategory);
}

extension WaypointDraftUi on WaypointDraft {
  PoiCategoryUi get categoryUi => PoiCategoryUi.from(poiCategory);
}
