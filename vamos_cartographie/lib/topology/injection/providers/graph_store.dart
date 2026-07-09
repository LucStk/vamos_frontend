import "package:riverpod_annotation/riverpod_annotation.dart";

import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/core.dart";
import "package:vamos_cartographie/topology/data/datasources/topology_remote_datasource.dart";
import "package:vamos_cartographie/topology/data/repositories/topology_repository_impl.dart";
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
