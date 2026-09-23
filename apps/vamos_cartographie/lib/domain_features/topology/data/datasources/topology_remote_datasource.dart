import 'package:ferry/ferry.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/network/network.dart';
import 'package:vamos_cartographie/domain_features/topology/data/data.dart';

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
