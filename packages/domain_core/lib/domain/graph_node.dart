import 'package:domain_core/domain/patchable.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph_node.freezed.dart';

@freezed
abstract class GraphNode<T extends HasId> with _$GraphNode<T> implements HasId {
  const GraphNode._();

  const factory GraphNode({
    required T current,
    T? lastRemoteValue,
    @Default(0) int revision,
  }) = _GraphNode<T>;

  factory GraphNode.initial(T initial) => GraphNode(
    current: initial,
    lastRemoteValue: initial is Patch ? null : initial,
  );

  @override
  Id<T> get id => current.id as Id<T>;

  bool get isRecomputing =>
      current is Patch ? (current as Patch).recomputing : false;

  bool get isPendingCreation => lastRemoteValue == null && current is Patch;

  T? get serverValue => lastRemoteValue;

  /// Applique un patch local (optimistic update)
  GraphNode<T> set(T value) => copyWith(
    current: value,
    lastRemoteValue: value is Patch ? lastRemoteValue : value,
    revision: revision + 1,
  );

  /// Revient à la dernière valeur confirmée par le serveur
  GraphNode<T> rollback() {
    if (current is! Patch || lastRemoteValue == null) {
      return this;
    }

    return copyWith(current: lastRemoteValue as T, revision: revision + 1);
  }
}
