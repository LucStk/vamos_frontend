// L'EffectRunner connaît le store, pas le reducer
import 'package:map_application/intents/intents.dart';
import 'package:trip_domain/trip_domain.dart';

class IntentResolver {
  final TopologyHandler topologyHandler;
  final WaypointHandler waypointHandler;
  IntentResolver(this.topologyHandler, this.waypointHandler);

  Future<void> run(MapIntents intent) async {
    switch (intent) {
      case CreateSimpleVertex e:
        await topologyHandler.createSimpleVertex(e.position);
      case UpdateVertexPosition e:
        await topologyHandler.moveVertex(e.vertexRef, e.position);
      case CreateWaypointFromVertex e:
        await waypointHandler.createBlankWaypoint(
          VertexId(e.vertexRef.id.value),
          null,
        );
      case _:
        print("Resolver not found for intent $intent");
    }
  }
}
