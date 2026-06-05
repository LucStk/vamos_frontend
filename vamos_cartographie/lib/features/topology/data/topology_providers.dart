import "datasources/segment_remote_datasource.dart";
import "repositories/segment_repository.dart";
import "package:riverpod/riverpod.dart";
import "package:vamos_cartographie/core/injection/client_provider.dart";

final segmentRemoteDatasourceProvider = Provider<SegmentRemoteDatasource>((
  ref,
) {
  return SegmentRemoteDatasource(ref.watch(clientProvider));
});

final segmentRepositoryProvider = Provider<SegmentRepository>((ref) {
  return SegmentRepository(ref.watch(segmentRemoteDatasourceProvider));
});
