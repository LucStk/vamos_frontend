// Dans trip_application — type union simple
import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/topology/domain/entities/entities.dart';

part 'vertex_ref.freezed.dart';

@freezed
sealed class VertexRef with _$VertexRef {
  const factory VertexRef.confirmed(VertexId id) = ConfirmedVertexRef;
  const factory VertexRef.pending(Id<VertexPatch> id) = PendingVertexRef;
}
