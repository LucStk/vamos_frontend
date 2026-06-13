import 'package:vamos_cartographie/core/type/id.dart';

sealed class EntityCommand<T> {}

class Insert<T> extends EntityCommand<T> {
  final T entity;
  Insert(this.entity);
}

class Update<T> extends EntityCommand<T> {
  final T entity;
  Update(this.entity);
}

class Remove<T> extends EntityCommand<T> {
  final Id<T> id;
  Remove(this.id);
}
