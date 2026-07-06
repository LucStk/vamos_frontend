import '/core/graphql/graphql.dart';
import "package:media_application/media_application.dart";

extension GOwnerTypeMappers on GOwnerType {
  MediaOwnerType toDomain() => switch (this) {
    GOwnerType.WAYPOINT => MediaOwnerType.waypoint,
    GOwnerType.TRIP => MediaOwnerType.trip,
    _ => throw (Exception("Other is not an option")),
  };
}

// 1. De ton modèle local (PoiCategory) VERS GraphQL (GPoiCategory)
extension MediaOwnerTypeMapper on MediaOwnerType {
  GOwnerType toGQL() => switch (this) {
    MediaOwnerType.waypoint => GOwnerType.WAYPOINT,
    MediaOwnerType.trip => GOwnerType.TRIP,
  };
}
