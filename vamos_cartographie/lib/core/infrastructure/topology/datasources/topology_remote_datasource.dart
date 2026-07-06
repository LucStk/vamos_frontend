import 'package:ferry/ferry.dart';
import 'package:trip_domain/trip_domain.dart';
import '/core/graphql/graphql.dart';

class TopologyRemoteDatasource {
  final Client client;

  TopologyRemoteDatasource(this.client);

  Future<GGetTopologyData_trip_topology> getTopology({
    required TripId tripId,
  }) async {
    final req = GGetTopologyReq(vars: GGetTopologyVars(tripId: tripId.value));
    final response = await client.request(req).first;

    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur dans le get des waypoints du trip',
      );
    }
    return response.data!.trip.topology;
  }
}
