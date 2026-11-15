import '/core/graphql/graphql.dart';

import 'package:trip_application/trip_application.dart';

extension GWaypointKindMapper on GWaypointKind {
  WaypointKind? toDomain() => switch (this) {
    GWaypointKind.RESUPPLY => WaypointKind.resupply,
    GWaypointKind.EAT => WaypointKind.eat,
    GWaypointKind.REPAIR => WaypointKind.repair,
    GWaypointKind.SIGHTSEE => WaypointKind.sightsee,
    _ => throw (Exception("Mapper GPoiCategory impossible pour $this")),
  };
}

// 1. De ton modèle local (PoiCategory) VERS GraphQL (GPoiCategory)
extension WaypointKindMapper on WaypointKind {
  GWaypointKind toGQL() => switch (this) {
    WaypointKind.resupply => GWaypointKind.RESUPPLY,
    WaypointKind.eat => GWaypointKind.EAT,
    WaypointKind.repair => GWaypointKind.REPAIR,
    WaypointKind.sightsee => GWaypointKind.SIGHTSEE,
  };
}
