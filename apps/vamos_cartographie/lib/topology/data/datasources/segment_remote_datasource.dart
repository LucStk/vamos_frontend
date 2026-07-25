import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/mappers/mappers.dart';
import 'package:vamos_cartographie/core/network/network.dart';
import 'package:vamos_cartographie/topology/data/graphql/fields/__generated__/segment_fields.data.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/mutation/__generated__/segment_mutations.req.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/mutation/__generated__/segment_mutations.var.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/queries/__generated__/segment_queries.req.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/queries/__generated__/segment_queries.var.gql.dart';
import 'package:vamos_cartographie/topology/data/mappers/mobility_type_mapper.dart';

import '/core/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';

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
    required VertexId startVertexId,
    required VertexId endVertexId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    final data = await ferryClient.execute(
      GCreateSegmentReq(
        vars: GCreateSegmentVars(
          tripId: tripId.value,
          segment: GSegmentCreateInput(
            startVertexId: startVertexId.value,
            endVertexId: endVertexId.value,
            mobilityType: mobilityType.toGQL(),
            geometry: geometry.map((m) => m.toGQLInput()).toList(),
          ),
        ),
      ),
    );
    return data.createSegment;
  }

  Future<GSegmentFields> updateSegment({
    required SegmentId id,
    required GSegmentUpdateInput input,
  }) async {
    final data = await ferryClient.execute(
      GUpdateSegmentReq(
        vars: GUpdateSegmentVars(id: id.value, segment: input),
      ),
    );
    return data.updateSegment;
  }

  Future<void> deleteSegment({required SegmentId id}) async {
    await ferryClient.execute(
      GDeleteSegmentReq(vars: GDeleteSegmentVars(segmentId: id.value)),
    );
  }
}
