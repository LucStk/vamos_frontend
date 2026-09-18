import 'package:domain_core/domain_core.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/topology/data/mappers/mappers.dart';

import '/core/graphql/graphql.dart';
import '/trip/data/graphql/graphql.dart';

/// ---------------------------------------------------------------------------
/// GraphQL -> Domain
/// ---------------------------------------------------------------------------

extension GTripFieldsMapper on GTripFields {
  Trip toDomain() => Trip(
    id: Id<Trip>(id),
    title: title,
    description: description,
    date: date == null ? null : DateTime.parse(date!),
  );
}

extension GTopologyFieldsMapper on GTopologyFields {
  TopologyRes toDomain() => TopologyRes(
    vertices.map((vertex) => vertex.toDomain()).toList(),
    segments.map((segment) => segment.toDomain()).toList(),
  );
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
