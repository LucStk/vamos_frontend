import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';

extension RouteAnchorMapper on RouteAnchor {
  GRouteAnchorInput toGQL() {
    return GRouteAnchorInput(point: position.toGQLInput(), sectionId: id.value);
  }
}
