import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';

import 'package:ferry/ferry.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
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

  Future<GEditRouteResult> extendRoute({
    required Id<Trip> tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    final data = await ferryClient.execute(
      GExtendRouteReq(
        vars: GExtendRouteVars(
          tripId: tripId.value,
          input: GExtendRouteInput(
            autoRoute: true,
            mobilityType: mobilityType.toGQL(),
            points: geometry.toGQLInput(),
          ),
        ),
      ),
    );
    return data.extendRoute;
  }

  Future<GEditRouteResult> prependRoute({
    required Id<Trip> tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    final data = await ferryClient.execute(
      GExtendRouteReq(
        vars: GExtendRouteVars(
          tripId: tripId.value,
          input: GExtendRouteInput(
            autoRoute: true,
            mobilityType: mobilityType.toGQL(),
            points: geometry.toGQLInput(),
          ),
        ),
      ),
    );
    return data.extendRoute;
  }

  Future<GEditRouteResult> redrawRoutePortion({
    required Id<Trip> tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
    required RouteAnchor startAnchor,
    required LatLng latLng,
    RouteAnchor? endAnchor,
  }) async {
    final data = await ferryClient.execute(
      GRedrawRoutePortionReq(
        vars: GRedrawRoutePortionVars(
          tripId: tripId.value,
          input: GRedrawRouteInput(
            start: startAnchor.toGQL(),
            end: (endAnchor != null)
                ? Value.present(endAnchor.toGQL())
                : Value.absent(),
            autoRoute: true,
            mobilityType: mobilityType.toGQL(),
            correction: geometry.toGQLInput(),
          ),
        ),
      ),
    );
    return data.redrawRoutePortion;
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
}
