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
import 'package:vamos_cartographie/domain_features/route/data/mappers/route_anchor_mappers.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class RouteRemoteDatasource {
  final Client ferryClient;

  RouteRemoteDatasource(this.ferryClient);
  /// Null : jamais calculées.
  Future<GRouteInsightsFields?> fetchRouteInsights(TripId tripId) async {
    final data = await ferryClient.execute(
      GFetchRouteInsightsReq(
        vars: GFetchRouteInsightsVars(tripId: tripId.value),
      ),
    );
    return data.routeInsights;
  }

  /// Null : le trip n'a pas de route.
  Future<GRouteInsightsFields?> recomputeRouteInsights(TripId tripId) async {
    final data = await ferryClient.execute(
      GRecomputeRouteInsightsReq(
        vars: GRecomputeRouteInsightsVars(tripId: tripId.value),
      ),
    );
    return data.recomputeRouteInsights;
  }

  Future<GElevationProfileFields?> fetchProposalElevation({
    required TripId tripId,
    required Id proposalId,
  }) async {
    final data = await ferryClient.execute(
      GFetchProposalElevationReq(
        vars: GFetchProposalElevationVars(
          tripId: tripId.value,
          proposalId: proposalId.value,
        ),
      ),
    );
    return data.routeProposalElevation;
  }

  Future<GProposalWaysFields?> fetchProposalWays({
    required TripId tripId,
    required Id proposalId,
  }) async {
    final data = await ferryClient.execute(
      GFetchProposalWaysReq(
        vars: GFetchProposalWaysVars(
          tripId: tripId.value,
          proposalId: proposalId.value,
        ),
      ),
    );
    return data.routeProposalWays;
  }

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
    bool autoRoute = true,
  }) async {
    final data = await ferryClient.execute(
      GEditRouteReq(
        vars: GEditRouteVars(
          tripId: tripId.value,
          input: GEditRouteInput(
            autoRoute: autoRoute,
            directRoute: false,
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
    required SpanId sectionId,
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
    required SpanId sectionId,
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

  Future<GEditRouteResult> setRangeMobility({
    required Id<Trip> tripId,
    required SectionAnchor start,
    required SectionAnchor end,
    required MobilityType mobilityType,
  }) async {
    final data = await ferryClient.execute(
      GSetRangeMobilityReq(
        vars: GSetRangeMobilityVars(
          tripId: tripId.value,
          input: GRangeMobilityInput(
            start: start.toGQLPoint(),
            end: end.toGQLPoint(),
            mobilityType: mobilityType.toGQL(),
          ),
        ),
      ),
    );
    return data.setRangeMobility;
  }

  Future<GEditRouteResult> deleteRoute({required Id<Trip> tripId}) async {
    final data = await ferryClient.execute(
      GDeleteRouteReq(vars: GDeleteRouteVars(tripId: tripId.value)),
    );
    return data.deleteRoute;
  }

  Future<GEditRouteResult> trimRoute({
    required Id<Trip> tripId,
    required EndpointAnchor end,
    required double lengthM,
  }) async {
    final data = await ferryClient.execute(
      GTrimRouteReq(
        vars: GTrimRouteVars(
          tripId: tripId.value,
          input: GTrimRouteInput(end: end.toGQLEndpoint(), lengthM: lengthM),
        ),
      ),
    );
    return data.trimRoute;
  }

  Future<GRoutePreviewResult> previewRouteEdit({
    required Id<Trip> tripId,
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,
    bool directRoute = false,
  }) async {
    final data = await ferryClient.execute(
      GPreviewRouteEditReq(
        vars: GPreviewRouteEditVars(
          tripId: tripId.value,
          input: GEditRouteInput(
            autoRoute: true,
            directRoute: directRoute,
            mobilityType: toFerryValue(mobilityType?.toGQL()),
            points: geometry.toGQLInput(),
            start: toFerryValue(startAnchor?.toGQL()),
            end: toFerryValue(endAnchor?.toGQL()),
          ),
        ),
      ),
    );
    return data.previewRouteEdit;
  }

  Future<GEditRouteResult> commitRouteEdit({
    required Id<Trip> tripId,
    required Id proposalId,
  }) async {
    final data = await ferryClient.execute(
      GCommitRouteEditReq(
        vars: GCommitRouteEditVars(
          tripId: tripId.value,
          proposalId: proposalId.value,
        ),
      ),
    );
    return data.commitRouteEdit;
  }

  Future<bool> discardRouteProposal({required Id<Trip> tripId}) async {
    final data = await ferryClient.execute(
      GDiscardRouteProposalReq(
        vars: GDiscardRouteProposalVars(tripId: tripId.value),
      ),
    );
    return data.discardRouteProposal;
  }
}
