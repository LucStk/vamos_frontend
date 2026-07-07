import '/core/graphql/graphql.dart';

import 'package:trip_domain/trip_domain.dart';

extension GPoiCategoryMapper on GPoiCategory {
  PoiCategory toDomain() => switch (this) {
    GPoiCategory.START => PoiCategory.start,
    GPoiCategory.END => PoiCategory.end,
    GPoiCategory.WAYPOINT => PoiCategory.waypoint,
    GPoiCategory.WATER => PoiCategory.water,
    GPoiCategory.FOOD => PoiCategory.food,
    GPoiCategory.REPAIR => PoiCategory.repair,
    GPoiCategory.SHELTER => PoiCategory.shelter,
    GPoiCategory.CAMPING => PoiCategory.camping,
    GPoiCategory.VIEWPOINT => PoiCategory.viewpoint,
    GPoiCategory.HISTORIC => PoiCategory.historic,
    GPoiCategory.BEACH => PoiCategory.beach,
    GPoiCategory.BOAT => PoiCategory.boat,
    GPoiCategory.WARNING => PoiCategory.warning,
    _ => throw (Exception("Mapper GPoiCategory impossible pour $this")),
  };
}

// 1. De ton modèle local (PoiCategory) VERS GraphQL (GPoiCategory)
extension PoiCategoryMapper on PoiCategory {
  GPoiCategory toGQL() => switch (this) {
    PoiCategory.start => GPoiCategory.START,
    PoiCategory.end => GPoiCategory.END,
    PoiCategory.waypoint => GPoiCategory.WAYPOINT,
    PoiCategory.water => GPoiCategory.WATER,
    PoiCategory.food => GPoiCategory.FOOD,
    PoiCategory.repair => GPoiCategory.REPAIR,
    PoiCategory.shelter => GPoiCategory.SHELTER,
    PoiCategory.camping => GPoiCategory.CAMPING,
    PoiCategory.viewpoint => GPoiCategory.VIEWPOINT,
    PoiCategory.historic => GPoiCategory.HISTORIC,
    PoiCategory.beach => GPoiCategory.BEACH,
    PoiCategory.boat => GPoiCategory.BOAT,
    PoiCategory.warning => GPoiCategory.WARNING,
    PoiCategory.other => throw (Exception("Other is not an option")),
  };
}
