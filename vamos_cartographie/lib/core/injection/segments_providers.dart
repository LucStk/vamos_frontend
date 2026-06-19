import 'package:riverpod_annotation/riverpod_annotation.dart';

import "package:vamos_cartographie/core/injection/client_provider.dart";
import 'package:topology_engine/data/datasources/segment_remote_datasource.dart';
import 'package:topology_engine/data/repositories/segment_repository.dart';
part 'segments_providers.g.dart';

@riverpod
SegmentRemoteDatasource segmentRemoteDatasource(Ref ref) {
  return SegmentRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
SegmentRepository segmentRepository(Ref ref) {
  return SegmentRepository(ref.watch(segmentRemoteDatasourceProvider));
}
