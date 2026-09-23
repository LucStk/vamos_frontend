import 'package:ferry/ferry.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/network/network.dart';
import 'package:vamos_cartographie/topology/data/graphql/queries/__generated__/topology_queries.data.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/queries/__generated__/topology_queries.req.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/queries/__generated__/topology_queries.var.gql.dart';

class TopologyRemoteDatasource {
  final Client ferryClient;

  TopologyRemoteDatasource(this.ferryClient);

  Future<GGetTopologyData_trip_topology> getTopology({
    required TripId tripId,
  }) async {
    final data = await ferryClient.execute(
      GGetTopologyReq(vars: GGetTopologyVars(tripId: tripId.value)),
    );
    return data.trip.topology;
  }
}
