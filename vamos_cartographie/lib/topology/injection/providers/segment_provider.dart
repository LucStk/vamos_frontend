import "package:riverpod_annotation/riverpod_annotation.dart";

import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/core.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
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
CollectionStore<Segment> segmentStore(Ref ref) {
  final graphStore = ref.watch(rawGraphStoreProvider);
  return graphStore.segmentStore;
}
