import 'package:latlong2/latlong.dart';

import 'package:ferry/ferry.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/core/network/ferry_client_x.dart';
import 'package:vamos_cartographie/domain_features/topology/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/topology/data/mappers/mobility_type_mapper.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class SegmentRemoteDatasource {
  final Client ferryClient;

  SegmentRemoteDatasource(this.ferryClient);

  Future<List<GSegmentFields>> getSegments({required Id<Trip> tripId}) async {
    final data = await ferryClient.execute(
      GGetSegmentsReq(vars: GGetSegmentsVars(tripId: tripId.value)),
    );
    return data.trip.topology.segments;
  }

  Future<GCreateSegmentPayloadFragment> createSegment({
    required Id<Trip> tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    final data = await ferryClient.execute(
      GCreateSegmentReq(
        vars: GCreateSegmentVars(
          tripId: tripId.value,
          segment: GSegmentCreateInput(
            mobilityType: mobilityType.toGQL(),
            geometry: geometry.map((m) => m.toGQLInput()).toList(),
          ),
        ),
      ),
    );
    return data.createSegment;
  }

  Future<GRefineSegmentPayloadFragment> refineSegment(SectionId id) async {
    final data = await ferryClient.execute(
      GRefineSegmentGeometryReq(
        vars: GRefineSegmentGeometryVars(segmentId: id.value),
      ),
    );
    return data.refineSegmentGeometry;
  }

  Future<GSegmentFields> updateSegment({
    required SectionId id,
    required GSegmentUpdateInput input,
  }) async {
    final data = await ferryClient.execute(
      GUpdateSegmentReq(
        vars: GUpdateSegmentVars(id: id.value, segment: input),
      ),
    );
    return data.updateSegment;
  }

  Future<GSegmentFields> correctSegment({
    required SectionId id,
    required GSegmentCorrectionInput input,
  }) async {
    final data = await ferryClient.execute(
      GCorrectSegmentReq(
        vars: GCorrectSegmentVars(segmentId: id.value, correction: input),
      ),
    );
    return data.correctSegment;
  }

  Future<GSegmentSplicePayloadFragment> spliceSegment({
    required TripId tripId,
    required GSpliceSegmentInput input,
  }) async {
    final data = await ferryClient.execute(
      GspliceSegmentReq(
        vars: GspliceSegmentVars(tripId: tripId.value, input: input),
      ),
    );
    return data.spliceSegment;
  }

  Future<void> deleteSegment({required SectionId id}) async {
    await ferryClient.execute(
      GDeleteSegmentReq(vars: GDeleteSegmentVars(segmentId: id.value)),
    );
  }
}
