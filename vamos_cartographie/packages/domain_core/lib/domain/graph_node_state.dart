import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "graph_node_state.freezed.dart";

abstract interface class Patch<T> implements HasId {
  bool get recomputing;
  Object? get error;
  T toEntity();
}

abstract interface class Patchable<T extends HasId> implements HasId {
  Patch<T> createPatch();
}

@freezed
sealed class NodeState<T extends Patchable<T>> with _$NodeState<T> {
  const NodeState._();

  const factory NodeState.hasValue(T value) = HasValue<T>;
  const factory NodeState.hasPatch({
    required Patch<T> patch,
    T? originalValue,
  }) = HasPatch<T>;

  factory NodeState.patchEntity(T value) =>
      NodeState.hasPatch(patch: value.createPatch(), originalValue: value);

  /// Vérité serveur si connue. `null` si le node est une création
  /// locale sans équivalent serveur pour l'instant.
  T? get serverValue => when(
    hasValue: (value) => value,
    hasPatch: (_, originalValue) => originalValue,
  );

  /// Valeur "à afficher" : optimiste si un patch est en vol,
  /// sinon la valeur stable. Générique grâce à `Patch<T>.toEntity()`.
  T get displayValue => when(
    hasValue: (value) => value,
    hasPatch: (patch, _) => patch.toEntity(),
  );

  bool get isRecomputing =>
      when(hasValue: (_) => false, hasPatch: (patch, _) => patch.recomputing);

  Object? get error =>
      when(hasValue: (_) => null, hasPatch: (patch, _) => patch.error);

  Id<T> get id => when(
    hasValue: (value) => value.id as Id<T>,
    hasPatch: (patch, _) => patch.id as Id<T>,
  );

  /// true si ce node n'a jamais existé côté serveur (création en attente).
  bool get isPendingCreation => serverValue == null && this is HasPatch<T>;
}
