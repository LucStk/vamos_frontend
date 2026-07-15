import 'package:domain_core/domain/patchable.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "graph_node_state.freezed.dart";

@freezed
sealed class NodeValueOrPatch<T extends Patchable<T>>
    with _$NodeValueOrPatch<T> {
  const factory NodeValueOrPatch.value(T value) = _ValueResult<T>;
  const factory NodeValueOrPatch.patch(Patch<T> patch) = _PatchResult<T>;
}

@freezed
sealed class NodeState<T extends Patchable<T>> with _$NodeState<T> {
  const NodeState._();

  const factory NodeState.hasValue(T value) = HasValue<T>;
  const factory NodeState.hasPatch({
    required Patch<T> patch,
    T? originalValue,
  }) = HasPatch<T>;

  /// locale sans équivalent serveur pour l'instant.
  T? get serverValue => when(
    hasValue: (value) => value,
    hasPatch: (_, originalValue) => originalValue,
  );
  NodeValueOrPatch<T> get valueOrPatch => when(
    hasValue: (value) => NodeValueOrPatch.value(value),
    hasPatch: (patch, _) => NodeValueOrPatch.patch(patch),
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
