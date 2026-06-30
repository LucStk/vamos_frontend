// Dans trip_domain — type union simple
import 'package:domain_core/id.dart';
import 'package:trip_domain/domain/entities/entities.dart';

sealed class VertexRef {
  const VertexRef();
}

class ConfirmedVertexRef extends VertexRef {
  final Id<Vertex> id;
  const ConfirmedVertexRef(this.id);
}

class PendingVertexRef extends VertexRef {
  final Id<VertexPatch> id;
  const PendingVertexRef(this.id);
}
