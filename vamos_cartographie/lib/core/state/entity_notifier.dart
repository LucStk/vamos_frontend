import "package:dartz/dartz.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:vamos_cartographie/core/type/has_id.dart";
import "package:vamos_cartographie/core/failure.dart";

class SyncAction<T> {
  final int txId;
  final Future<void> Function() execute;

  SyncAction({required this.txId, required this.execute});
}

mixin EntityNotifier<T extends HasId> {
  AsyncValue<Map<int, T>> get state;
  set state(AsyncValue<Map<int, T>> value);

  Map<int, T> get current => state.value ?? {};

  int _tx = 0;
  final List<SyncAction> _queue = [];

  // ─────────────────────────────
  // Core map ops
  // ─────────────────────────────

  Map<int, T> _set(Map<int, T> map, T value) {
    final next = Map<int, T>.from(map);
    next[value.id] = value;
    return next;
  }

  Map<int, T> _remove(Map<int, T> map, int id) {
    final next = Map<int, T>.from(map)..remove(id);
    return next;
  }

  void emit(Map<int, T> next) {
    state = AsyncData(next);
  }

  // ─────────────────────────────
  // Public API
  // ─────────────────────────────

  void upsertLocal(T entity) => emit(_set(current, entity));
  void updateLocal(T entity) => emit(_set(current, entity));
  void removeLocal(int id) => emit(_remove(current, id));

  // ─────────────────────────────
  // ✔ OPTIMISTIC CORE (Either + rollback safe)
  // ─────────────────────────────

  Future<void> optimistic<TRemote>({
    required Map<int, T> Function() local,
    required Future<Either<Failure, TRemote>> Function() remote,
    required void Function(TRemote result) onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    final txId = ++_tx;
    final previous = current;

    // 1. apply optimistic state
    emit(local());

    // 2. remote call
    final result = await remote();

    // 3. ignore stale rollback (anti double rollback)
    if (txId != _tx) return;

    result.fold(
      (failure) {
        emit(previous);
        onFailure?.call(failure);
      },
      (data) {
        onSuccess(data);
      },
    );
  }

  // ─────────────────────────────
  // Offline queue
  // ─────────────────────────────

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
