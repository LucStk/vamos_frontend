import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';

enum MediaOwnerType { waypoint, trip }

MediaOwnerType ownerType(Object entity) {
  if (entity is Trip) {
    return MediaOwnerType.trip;
  }
  if (entity is Waypoint) {
    return MediaOwnerType.waypoint;
  }
  throw Exception("Media is not implemented for Type");
}

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
