// L'EffectRunner connaît le store, pas le reducer
import 'package:map_application/map_application.dart';
import 'package:trip_application/topology/application/topology_handler.dart';
import 'package:trip_application/topology/domain/entities/vertex/vertex_model.dart';
import "package:trip_application/trip_application.dart";

class IntentResolver {
  final TopologyHandler topologyHandler;
  final WaypointHandler waypointHandler;
  final MapOutput mapOutput;
  IntentResolver(this.topologyHandler, this.waypointHandler, this.mapOutput);

  Future<void> run(MapIntents intent) async {
    switch (intent) {
      case CreateSimpleVertex e:
        await topologyHandler.createSimpleVertex(e.position);
      case UpdateVertexPosition e:
        await topologyHandler.moveVertex(e.vertexRef, e.position);
      case CreateWaypointFromVertex e:
        await waypointHandler.createBlankWaypointFromVertex(
          VertexId(e.vertexRef.id.value),
        );
      case OpenWaypointDialog e:
        mapOutput.emit(OpenWaypointDialogEvent(e.waypointId));

      case _:
        print("Resolver not found for intent $intent");
    }
  }
}
