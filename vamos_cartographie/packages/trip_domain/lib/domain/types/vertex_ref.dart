// Dans trip_domain — type union simple
import 'package:domain_core/has_id.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_domain/domain/entities/entities.dart';

part 'vertex_ref.freezed.dart';

@freezed
sealed class VertexRef with _$VertexRef {
  const factory VertexRef.confirmed(Id<Vertex> id) = ConfirmedVertexRef;
  const factory VertexRef.pending(Id<VertexPatch> id) = PendingVertexRef;
}
