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
  final int id;
  Remove(this.id);
}
