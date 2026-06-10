abstract class EntityNotifier<T> {
  AsyncValue<Map<int, T>> get state;
  set state(AsyncValue<Map<int, T>> value);

  int getEntityId(T entity);

  Map<int, T> get current => state.value ?? {};

  void emit(Map<int, T> next) {
    state = AsyncData(next);
  }

  void upsertLocal(T entity) {
    emit(EntityStoreHelpers.set(current, getEntityId(entity), entity));
  }

  void removeLocal(int id) {
    emit(EntityStoreHelpers.remove(current, id));
  }
}
