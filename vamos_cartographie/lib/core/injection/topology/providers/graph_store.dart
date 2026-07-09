import "package:riverpod_annotation/riverpod_annotation.dart";

import "package:trip_domain/trip_domain.dart";
import "package:vamos_cartographie/core/core.dart";
import "package:vamos_cartographie/core/services/add_listener_to_observable.dart";
part "graph_store.g.dart";

@riverpod
TopologyRemoteDatasource topologyRemoteDatasource(Ref ref) {
  return TopologyRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
TopologyRepository topologyRepository(Ref ref) {
  return TopologyRepositoryImpl(ref.watch(topologyRemoteDatasourceProvider));
}

@Riverpod(keepAlive: true)
GraphStore rawGraphStore(Ref ref) => GraphStore();

@Riverpod(keepAlive: true)
GraphPatchStore rawGraphPatchStore(Ref ref) => GraphPatchStore();
