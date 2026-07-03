// L'EffectRunner connaît le store, pas le reducer
import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';

import '/effects/map_effect.dart';

class EffectRunner {
  final TopologyHandler topologyHandler;
  final ErrorLogger? errorLogger;
  EffectRunner(this.topologyHandler, this.errorLogger);

  Future<void> run(MapEffect effect) async {
    final Either<Failure, Object> res = switch (effect) {
      CreateSimpleVertexEffect e => await topologyHandler.createSimpleVertex(
        e.position,
      ),
      MoveVertexEffect e => await topologyHandler.moveVertex(
        e.vertexId,
        e.newPosition,
      ),
    };

    res.fold(
      (failure) => errorLogger?.logError(failure),
      (_) => null, // succès, rien à faire
    );
  }
}
