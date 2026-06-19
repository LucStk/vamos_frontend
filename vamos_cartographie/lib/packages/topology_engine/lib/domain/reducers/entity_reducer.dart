import "package:domain_core/domain_core.dart";
import "package:vamos_cartographie/packages/topology_engine/lib/domain/commands/entity_command.dart"
    show EntityCommand, Insert, Update, Remove;

class EntityReducer<T extends HasId<T>> {
  Map<Id<T>, T> reduce(Map<Id<T>, T> state, EntityCommand<T> command) {
    final next = Map<Id<T>, T>.from(state);

    return switch (command) {
      Insert<T> cmd => (next..[cmd.entity.id] = cmd.entity),
      Update<T> cmd => (next..[cmd.entity.id] = cmd.entity),
      Remove<T> cmd => (next..remove(cmd.id)),
      _ => next,
    };
  }
}
