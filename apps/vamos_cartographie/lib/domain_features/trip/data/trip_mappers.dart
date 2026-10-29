import 'package:domain_core/domain_core.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/route_mappers.dart';
import 'package:vamos_cartographie/domain_features/trip/data/graphql/graphql.dart';

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
    geometry: route.toDomain(),
    bounds: bounds?.toBounds(),
    startPoint: startPoint.toLatLng(),
  );
  Iterable<RouteSectionRemoteModel> toSections() =>
      sections.map((m) => m.toDomain());
}

/// ---------------------------------------------------------------------------
/// Domain -> GraphQL
/// ---------------------------------------------------------------------------

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
