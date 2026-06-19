import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import "package:vamos_cartographie/core/core.dart";
import 'package:topology_engine/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le client Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class SegmentRemoteDatasource {
  final Client client;

  SegmentRemoteDatasource(this.client);

  Future<List<GSegmentFields>> getSegments({required Id<Trip> tripId}) async {
    final req = GGetSegmentsReq(vars: GGetSegmentsVars(tripId: tripId.value));
    final response = await client.request(req).first;

    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur dans le get des waypoints du trip',
      );
    }
    return response.data!.trip.topology.segments;
  }

  Future<GSegmentFields> createSegment({
    required Id<Trip> tripId,
    required GSegmentCreateInput input,
  }) async {
    final req = GCreateSegmentReq(
      vars: GCreateSegmentVars(tripId: tripId.value, segment: input),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur dans la création du waypoint',
      );
    }
    return response.data!.createSegment;
  }

  Future<GSegmentFields> updateSegment({
    required Id<Segment> id,
    required GSegmentUpdateInput input,
  }) async {
    final req = GUpdateSegmentReq(
      vars: GUpdateSegmentVars(id: id.value, segment: input),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la mise à jour du Segment',
      );
    }
    return response.data!.updateSegment;
  }

  Future<void> deleteSegment({required Id<Segment> id}) async {
    final req = GDeleteSegmentReq(
      vars: GDeleteSegmentVars(segmentId: id.value),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la suppression du waypoint',
      );
    }
  }
}
