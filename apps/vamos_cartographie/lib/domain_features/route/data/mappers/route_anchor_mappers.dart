import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';

extension RouteAnchorMapper on RouteAnchor {
  GRouteAnchorInput toGQL() => switch (this) {
    SectionAnchor anchor => GRouteAnchorInput(
      section: Value.present(
        GSectionAnchorInput(
          point: anchor.position.toGQLInput(),
          sectionId: anchor.sectionId.value,
        ),
      ),
    ),
    StartRouteAnchor() => GRouteAnchorInput(
      endpoint: Value.present(GRouteEndpoint.ROUTE_START),
    ),
    EndRouteAnchor() => GRouteAnchorInput(
      endpoint: Value.present(GRouteEndpoint.ROUTE_END),
    ),
  };
}
