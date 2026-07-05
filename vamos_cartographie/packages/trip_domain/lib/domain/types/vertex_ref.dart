// Dans trip_domain — type union simple
import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_domain/domain/entities/entities.dart';
import 'package:trip_domain/domain/types/Ids.dart';

part 'vertex_ref.freezed.dart';

@freezed
sealed class VertexRef with _$VertexRef {
  const factory VertexRef.confirmed(VertexId id) = ConfirmedVertexRef;
  const factory VertexRef.pending(Id<VertexPatch> id) = PendingVertexRef;
}
