import "package:dartz/dartz.dart";
import "package:flutter/animation.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:vamos_cartographie/core/type/has_id.dart";
import "package:vamos_cartographie/core/failure.dart";
import "entity_command.dart";
import "entity_reducer.dart";

class SyncAction<T> {
  final int txId;
  final Future<void> Function() execute;
  final Future<void> Function()? rollback;

  SyncAction({required this.txId, required this.execute, this.rollback});
}

mixin EntityNotifier<T extends HasId> {
  AsyncValue<Map<int, T>> get state;
  set state(AsyncValue<Map<int, T>> value);

  final EntityReducer<T> _reducer = EntityReducer<T>();

  Map<int, T> get current => state.value ?? {};

  void emit(Map<int, T> next) {
    state = AsyncData(next);
  }

  void dispatch(EntityCommand<T> command) {
    emit(_reducer.reduce(current, command));
  }

  int _tx = 0;
  final List<SyncAction> _queue = [];

  int _tempId = -1;
  int nextTempId() => _tempId--;

  void upsertLocal(T entity) => dispatch(Insert(entity));
  void updateLocal(T entity) => dispatch(Update(entity));
  void removeLocal(int id) => dispatch(Remove(id));

  T? tryGet(int id) => current[id];

  T getOrThrow(int id) {
    final entity = current[id];
    if (entity == null) {
      throw StateError("$T $id not found in store");
    }
    return entity;
  }

  Future<void> optimistic({
    required VoidCallback optimistic,
    required VoidCallback rollback,
    required Future<Either<Failure, dynamic>> Function() remote,
    required void Function(dynamic result) onSuccess,
  }) async {
    final txId = ++_tx;
    optimistic();
    final result = await remote();
    if (txId != _tx) return;
    result.fold((failure) => rollback(), (data) => onSuccess(data));
  }

  void enqueue(SyncAction action) {
    _queue.add(action);
  }

  Future<void> flushQueue() async {
    final queue = List<SyncAction>.from(_queue);
    _queue.clear();

    for (final action in queue) {
      try {
        await action.execute();
      } catch (_) {
        _queue.add(action); // retry later
      }
    }
  }
}
