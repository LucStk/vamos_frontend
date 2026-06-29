// L'EffectRunner connaît le store, pas le reducer
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/features/map_editor/map_editor.dart';

class EffectRunner {
  final TopologyHandler topologyHandler;
  EffectRunner(this.topologyHandler);

  Future<void> run(MapEffect effect) async {
    switch (effect) {
      case MoveVertexEffect e:
        await topologyHandler.moveVertex(e.vertexId, e.newPosition);
    }
  }
}
