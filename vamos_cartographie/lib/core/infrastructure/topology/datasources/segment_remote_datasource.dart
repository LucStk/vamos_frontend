import 'package:vamos_cartographie/core/network/network.dart';

import '/core/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';

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

  Future<GSegmentFields> createSegment({
    required Id<Trip> tripId,
    required GSegmentCreateInput input,
  }) async {
    final data = await ferryClient.execute(
      GCreateSegmentReq(
        vars: GCreateSegmentVars(tripId: tripId.value, segment: input),
      ),
    );
    return data.createSegment;
  }

  Future<GSegmentFields> updateSegment({
    required Id<Segment> id,
    required GSegmentUpdateInput input,
  }) async {
    final data = await ferryClient.execute(
      GUpdateSegmentReq(
        vars: GUpdateSegmentVars(id: id.value, segment: input),
      ),
    );
    return data.updateSegment;
  }

  Future<void> deleteSegment({required Id<Segment> id}) async {
    await ferryClient.execute(
      GDeleteSegmentReq(vars: GDeleteSegmentVars(segmentId: id.value)),
    );
  }
}
