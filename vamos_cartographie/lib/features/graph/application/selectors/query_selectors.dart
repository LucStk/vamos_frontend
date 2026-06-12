import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/application/providers/graph_providers.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';

part 'query_selectors.g.dart';

@riverpod
List<T> query<T>(Ref ref, bool Function(T entity) predicate) {
  final store = ref.watch(graphStoreProvider);

  // dépendance structurelle (ajout/suppression)
  ref.watch(collectionListenableProvider<T>());

  return store.getAll<T>().values.where(predicate).toList(growable: false);
}

@riverpod
Map<K, List<T>> indexedBy<T, K>(Ref ref, K Function(T entity) keySelector) {
  final store = ref.watch(graphStoreProvider);

  // dépendance structurelle
  ref.watch(collectionListenableProvider<T>());

  final map = <K, List<T>>{};

  for (final e in store.getAll<T>().values) {
    final key = keySelector(e);
    map.putIfAbsent(key, () => []).add(e);
  }

  return map;
}

@riverpod
List<T> queryLive<T>(Ref ref, bool Function(T entity) predicate) {
  final store = ref.watch(graphStoreProvider);

  ref.watch(collectionListenableProvider<T>());

  final all = store.getAll<T>();

  // ⚠️ attention: ici on écoute chaque node
  for (final id in all.keys) {
    ref.watch(nodeListenableProvider<T>(id));
  }

  return all.values.where(predicate).toList();
}
