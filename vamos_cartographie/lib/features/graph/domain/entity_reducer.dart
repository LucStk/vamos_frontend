import "package:vamos_cartographie/core/type/id.dart";

import "entity_command.dart";
import "package:vamos_cartographie/core/type/has_id.dart";

class EntityReducer<T extends HasId<T>> {
  Map<Id<T>, T> reduce(Map<Id<T>, T> state, EntityCommand<T> command) {
    final next = Map<Id<T>, T>.from(state);

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
