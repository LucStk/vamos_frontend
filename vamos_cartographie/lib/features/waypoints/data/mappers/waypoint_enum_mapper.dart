import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:vamos_cartographie/features/waypoints/domain/types/waypoint_type.dart';

extension GWaypointEnumMapper on GWaypointEnum {
  WaypointType toDomain() => switch (this) {
    GWaypointEnum.START => WaypointType.start,
    GWaypointEnum.END => WaypointType.end,
    GWaypointEnum.WAYPOINT => WaypointType.waypoint,
    GWaypointEnum.WATER => WaypointType.water,
    GWaypointEnum.FOOD => WaypointType.food,
    GWaypointEnum.REPAIR => WaypointType.repair,
    GWaypointEnum.SHELTER => WaypointType.shelter,
    GWaypointEnum.CAMPING => WaypointType.camping,
    GWaypointEnum.VIEWPOINT => WaypointType.viewpoint,
    GWaypointEnum.HISTORIC => WaypointType.historic,
    GWaypointEnum.BEACH => WaypointType.beach,
    GWaypointEnum.BOAT => WaypointType.boat,
    GWaypointEnum.WARNING => WaypointType.warning,
    _ => WaypointType.other,
  };
}

// 1. De ton modèle local (WaypointType) VERS GraphQL (GWaypointEnum)
extension WaypointTypeMapper on WaypointType {
  GWaypointEnum toGQL() => switch (this) {
    WaypointType.start => GWaypointEnum.START,
    WaypointType.end => GWaypointEnum.END,
    WaypointType.waypoint => GWaypointEnum.WAYPOINT,
    WaypointType.water => GWaypointEnum.WATER,
    WaypointType.food => GWaypointEnum.FOOD,
    WaypointType.repair => GWaypointEnum.REPAIR,
    WaypointType.shelter => GWaypointEnum.SHELTER,
    WaypointType.camping => GWaypointEnum.CAMPING,
    WaypointType.viewpoint => GWaypointEnum.VIEWPOINT,
    WaypointType.historic => GWaypointEnum.HISTORIC,
    WaypointType.beach => GWaypointEnum.BEACH,
    WaypointType.boat => GWaypointEnum.BOAT,
    WaypointType.warning => GWaypointEnum.WARNING,
    WaypointType.other => throw (Exception("Other is not an option")),
  };
}
