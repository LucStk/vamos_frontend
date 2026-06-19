import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/core/injection/topology_providers.dart';
import 'package:vamos_cartographie/packages/topology_application/queries/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

part 'query_selectors.g.dart';

@riverpod
List<T> query<T>(Ref ref, Id<Trip> tripId, bool Function(T entity) predicate) {
  final store = ref.watch(tripGraphProvider(tripId)).requireValue;
  // dépendance structurelle (ajout/suppression)
  ref.watch(collectionProvider<T>(tripId));

  return store.getAll<T>().values.where(predicate).toList(growable: false);
}

@riverpod
List<Id<T>> getIds<T>(Ref ref, Id<Trip> tripId) {
  final collection = ref.watch(collectionProvider<T>(tripId));
  return collection.keys.toList();
}

@riverpod
Map<K, List<T>> indexedBy<T, K>(
  Ref ref,
  Id<Trip> tripId,
  K Function(T entity) keySelector,
) {
  final store = ref.watch(tripGraphProvider(tripId)).requireValue;
  // dépendance structurelle
  ref.watch(collectionProvider<T>(tripId));

  final map = <K, List<T>>{};

  for (final e in store.getAll<T>().values) {
    final key = keySelector(e);
    map.putIfAbsent(key, () => []).add(e);
  }

  return map;
}

@riverpod
List<T> queryLive<T>(
  Ref ref,
  Id<Trip> tripId,
  bool Function(T entity) predicate,
) {
  final store = ref.watch(tripGraphProvider(tripId)).requireValue;

  ref.watch(collectionProvider<T>(tripId));

  final all = store.getAll<T>();

  // ⚠️ attention: ici on écoute chaque node
  for (final id in all.keys) {
    ref.watch(nodeProvider<T>(tripId, id));
  }

  return all.values.where(predicate).toList();
}
