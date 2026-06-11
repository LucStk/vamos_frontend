import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:ferry/ferry.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le client Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class SegmentRemoteDatasource {
  final Client client;

  SegmentRemoteDatasource(this.client);

  Future<List<GSegmentFields>> getSegments({required int tripId}) async {
    final req = GGetSegmentsReq(vars: GGetSegmentsVars(tripId: tripId));
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
    required int tripId,
    required GSegmentCreateInput input,
  }) async {
    final req = GCreateSegmentReq(
      vars: GCreateSegmentVars(tripId: tripId, segment: input),
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
    required int id,
    required GSegmentUpdateInput input,
  }) async {
    final req = GUpdateSegmentReq(
      vars: GUpdateSegmentVars(id: id, segment: input),
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

  Future<void> deleteSegment({required int id}) async {
    final req = GDeleteSegmentReq(vars: GDeleteSegmentVars(segmentId: id));
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la suppression du waypoint',
      );
    }
  }
}
