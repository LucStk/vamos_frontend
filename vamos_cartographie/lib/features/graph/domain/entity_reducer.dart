import "entity_command.dart";
import "package:vamos_cartographie/core/type/has_id.dart";

class EntityReducer<T extends HasId> {
  Map<int, T> reduce(Map<int, T> state, EntityCommand<T> command) {
    final next = Map<int, T>.from(state);

    switch (command) {
      case Insert<T>():
        next[command.entity.id] = command.entity;
        return next;

      case Update<T>():
        next[command.entity.id] = command.entity;
        return next;

      case Remove<T>():
        next.remove(command.id);
        return next;
    }
  }
}
