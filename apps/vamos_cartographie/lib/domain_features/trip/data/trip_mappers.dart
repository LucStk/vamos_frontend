import 'package:domain_core/domain_core.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/bounds_mapper.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/mobility_type_mapper.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/route_mappers.dart';
import 'package:vamos_cartographie/domain_features/stored_file/data/mappers/stored_file_mappers.dart';
import 'package:vamos_cartographie/domain_features/trip/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/user_profile/data/user_profile_mappers.dart';

/// ---------------------------------------------------------------------------
/// GraphQL -> Domain
/// ---------------------------------------------------------------------------

extension GTripFieldsMapper on GTripSummary {
  Trip toDomain() => Trip(
    id: Id<Trip>(id),
    ownerId: UserId(owner.id),
    title: title,
    description: description,
    date: date == null ? null : DateTime.parse(date!),
    // bounds: bounds == null ? null : (bounds as List<dynamic>).toDomain(),
  );
  TripSummary toTripSummary() => TripSummary(
    trip: toDomain(),
    storedFiles: files.map((m) => m.toDomain()).toList(),
  );
}

extension GTripWithRouteFieldsMapper on GTripFull {
  Trip toTripDomain() => Trip(
    id: Id<Trip>(id),
    ownerId: UserId(owner.id),
    title: title,
    description: description,
    date: date == null ? null : DateTime.parse(date!),
    // bounds: bounds == null ? null : (bounds as List<dynamic>).toDomain(),
  );
  RouteRemoteModel toRouteDomain() => RouteRemoteModel(
    id: Id<Trip>(id),
    geometry: route.map((m) => m.toLatLng()).toList(),
    bounds: bounds?.toMapBounds(),
    startPoint: startPoint.toLatLng(),
  );
  RoutePayload toRoutePayload() => RoutePayload(
    route: toRouteDomain(),
    mobilitySpans: mobilitySpans.map((m) => m.toMobilityDomain()),
    editSpans: editSpans.map((m) => m.toEditSpanDomain()),
  );
  Iterable<WaypointPayload> toWaypointsPayload() => waypoints.map(
    (m) => WaypointPayload(images: m.toImages(), waypoint: m.toDomain()),
  );
}

extension GDiscoveryTileMapper on GDiscoverTripsData_discoverTrips {
  DiscoveryTileResult toDomain() => DiscoveryTileResult(
    tile: DiscoveryTile(z, x, y),
    trips: [
      for (final t in trips)
        DiscoveredTrip(
          summary: t.trip.toTripSummary(),
          owner: t.trip.owner.toUserProfileModel(),
          score: t.score,
          preview: [
            for (final part in t.preview) [for (final p in part) p.toLatLng()],
          ],
        ),
    ],
  );
}

/// ---------------------------------------------------------------------------
/// Domain -> GraphQL
/// ---------------------------------------------------------------------------

extension TripDiscoveryFiltersToGQL on TripDiscoveryFilters {
  GTripDiscoveryFilters toGQL() => GTripDiscoveryFilters(
    minDays: Value.present(minDays),
    maxDays: Value.present(maxDays),
    mobilities: Value.present(
      mobilities.isEmpty ? null : [for (final m in mobilities) m.toGQL()],
    ),
    minLengthKm: Value.present(minLengthKm),
    maxLengthKm: Value.present(maxLengthKm),
  );
}

extension TripToGQLMapper on Trip {
  GTripUpdateInput toGQLUpdateInput() => GTripUpdateInput(
    title: Value.present(title),
    description: description.isEmpty
        ? const Value.absent()
        : Value.present(description),
    date: date == null
        ? const Value.absent()
        : Value.present(date!.toIso8601String().substring(0, 10)),
  );
}
