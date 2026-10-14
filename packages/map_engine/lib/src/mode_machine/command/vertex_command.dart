import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/scopes.dart';
import 'package:map_engine/src/mode_machine/effect/results.dart';
import 'package:trip_application/trip_application.dart';

sealed class VertexCommand<R extends Object> extends Command<R, TopologyScope> {
  const VertexCommand();
}

final class CreateSimpleVertex extends VertexCommand<VertexId> {
  const CreateSimpleVertex(this.position);
  final OffsetType position;

  @override
  Future<VertexId?> handle(TopologyScope h) {
    final latLng = switch (position) {
      WorldOffset d => h.camera.worldOffsetToLatLng(d),
      ScreenOffset d => h.camera.screenOffsetToLatLng(d),
    };
    return valueOrNull(
      h.graphEditor
          .createSimpleVertex(latLng)
          .then((r) => r.map((v) => v.id)), // Either<Failure, VertexId>
    );
  }
}

final class RemoveVertex extends VertexCommand<Done> {
  const RemoveVertex(this.vertexId);
  final VertexId vertexId;

  @override
  Future<Done?> handle(TopologyScope h) =>
      done(() => h.graphEditor.removeVertex(vertexId));
}

final class MoveVertex extends VertexCommand<Done> {
  const MoveVertex(this.vertexId, this.position);
  final VertexId vertexId;
  final LatLng position;

  @override
  Future<Done?> handle(TopologyScope h) =>
      done(() => h.graphEditor.moveVertex(vertexId, position));
}
