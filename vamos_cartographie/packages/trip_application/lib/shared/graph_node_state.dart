// 1. On applique la contrainte dès la classe de base
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "graph_node_state.freezed.dart";

abstract interface class Patch<T> implements HasId {
  T toEntity();
}

abstract interface class Patchable<T extends HasId> implements HasId {
  Patch<T> createPatch();
}

@freezed
sealed class NodeState<T extends Patchable<T>> with _$NodeState<T> {
  const NodeState._(); // Requis pour ajouter des getters/méthodes

  const factory NodeState.hasValue(T value) = HasValue<T>;
  const factory NodeState.hasPatch({
    required Patch<T> patch,
    T? originalValue,
  }) = HasPatch<T>;

  factory NodeState.patchEntity(T value) =>
      NodeState.hasPatch(patch: value.createPatch(), originalValue: value);

  T? get originalValue => when(
    hasValue: (value) => value,
    hasPatch: (_, originalValue) => originalValue,
  );
  // Ton getter magique reste inchangé et super propre grâce au pattern matching de Freezed
  Id<T> get id {
    return when(
      hasValue: (value) => value.id as Id<T>,
      hasPatch: (patch, _) => patch.id as Id<T>,
    );
  }
}
