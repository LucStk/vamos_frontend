import "package:vamos_cartographie/core/type/id.dart";
import "package:vamos_cartographie/core/type/has_id.dart";
import "package:vamos_cartographie/features/topology/domain/commands/entity_command.dart";

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
