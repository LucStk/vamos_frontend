import "package:riverpod_annotation/riverpod_annotation.dart";

import "package:trip_domain/trip_domain.dart";
import "package:vamos_cartographie/core/core.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/core/services/add_listener_to_observable.dart";
import "package:vamos_cartographie/topology/data/datasources/segment_remote_datasource.dart";
import "package:vamos_cartographie/topology/data/repositories/segment_repository_impl.dart";
import "package:vamos_cartographie/topology/injection/injection.dart";
part "segment_provider.g.dart";

@riverpod
SegmentRemoteDatasource segmentRemoteDatasource(Ref ref) {
  return SegmentRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
SegmentRepository segmentRepository(Ref ref) {
  return SegmentRepositoryImpl(ref.watch(segmentRemoteDatasourceProvider));
}

@riverpod
ObservableCollectionStore<Segment> segmentStore(Ref ref) {
  final graphStore = ref.watch(rawGraphStoreProvider);
  addListenerRebuild(ref, graphStore.segmentStore);
  return graphStore.segmentStore;
}

@riverpod
ObservableCollectionStore<SegmentPatch> segmentPatchStore(Ref ref) {
  final graphStore = ref.watch(rawGraphPatchStoreProvider);
  addListenerRebuild(ref, graphStore.segmentPatchStore);
  return graphStore.segmentPatchStore;
}
