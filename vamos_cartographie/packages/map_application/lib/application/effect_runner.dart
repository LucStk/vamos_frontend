// L'EffectRunner connaît le store, pas le reducer
import 'package:trip_domain/trip_domain.dart';

import '/effects/map_effect.dart';

class EffectRunner {
  final TopologyHandler topologyHandler;
  EffectRunner(this.topologyHandler);

  Future<void> run(MapEffect effect) async {
    switch (effect) {
      case CreateSimpleVertexEffect e:
        await topologyHandler.createSimpleVertex(e.position);
      case MoveVertexEffect e:
        await topologyHandler.moveVertex(e.vertexRef, e.newPosition);
    }
  }
}
