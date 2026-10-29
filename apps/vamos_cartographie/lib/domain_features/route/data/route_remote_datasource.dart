import 'package:latlong2/latlong.dart';

import 'package:ferry/ferry.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/core/mappers/to_ferry_value.dart';
import 'package:vamos_cartographie/core/network/ferry_client_x.dart';
import 'package:vamos_cartographie/domain_features/route/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/mobility_type_mapper.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/route_mappers.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class RouteRemoteDatasource {
  final Client ferryClient;

  RouteRemoteDatasource(this.ferryClient);
  Future<GEditRouteResult> setTripOrigin({
    required Id<Trip> tripId,
    required LatLng position,
  }) async {
    final data = await ferryClient.execute(
      GSetTripOriginReq(
        vars: GSetTripOriginVars(
          tripId: tripId.value,
          origin: position.toGQLInput(),
        ),
      ),
    );
    return data.setTripOrigin;
  }

  Future<GEditRouteResult> editRoute({
    required Id<Trip> tripId,
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,
  }) async {
    final data = await ferryClient.execute(
      GEditRouteReq(
        vars: GEditRouteVars(
          tripId: tripId.value,
          input: GEditRouteInput(
            autoRoute: true,
            mobilityType: toFerryValue(mobilityType?.toGQL()),
            points: geometry.toGQLInput(),
            start: toFerryValue(startAnchor?.toGQL()),
            end: toFerryValue(endAnchor?.toGQL()),
          ),
        ),
      ),
    );
    return data.editRoute;
  }

  Future<GEditRouteResult> refineSection({
    required Id<Trip> tripId,
    required SectionId sectionId,
  }) async {
    final data = await ferryClient.execute(
      GRefineSectionReq(
        vars: GRefineSectionVars(
          tripId: tripId.value,
          sectionId: sectionId.value,
        ),
      ),
    );
    return data.refineSection;
  }

  Future<GEditRouteResult> setSectionMobility({
    required Id<Trip> tripId,
    required SectionId sectionId,
    required MobilityType mobilityType,
  }) async {
    final data = await ferryClient.execute(
      GSetSectionMobilityReq(
        vars: GSetSectionMobilityVars(
          tripId: tripId.value,
          sectionId: sectionId.value,
          mobilityType: mobilityType.toGQL(),
        ),
      ),
    );
    return data.setSectionMobility;
  }

  Future<GEditRouteResult> deleteRoute({required Id<Trip> tripId}) async {
    final data = await ferryClient.execute(
      GDeleteRouteReq(vars: GDeleteRouteVars(tripId: tripId.value)),
    );
    return data.deleteRoute;
  }
}
