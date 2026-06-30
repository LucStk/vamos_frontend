// L'EffectRunner connaît le store, pas le reducer
import 'package:map_application/map_application.dart';
import 'package:trip_domain/trip_domain.dart';

class EffectRunner {
  final TopologyHandler topologyHandler;
  EffectRunner(this.topologyHandler);

  Future<void> run(MapEffect effect) async {
    switch (effect) {
      case CreateSimpleVertex e:
        await topologyHandler.createSimpleVertex(e.position);
      case MoveVertexEffect e:
        await topologyHandler.moveVertex(e.vertexId, e.newPosition);
    }
  }
}
