import 'package:riverpod_annotation/riverpod_annotation.dart';

import "package:vamos_cartographie/core/injection/client_provider.dart";
import 'package:vamos_cartographie/infrastructure/topology/datasources/segment_remote_datasource.dart';
import 'package:vamos_cartographie/infrastructure/topology/repositories/segment_repository.dart';
part 'segments_providers.g.dart';

@riverpod
SegmentRemoteDatasource segmentRemoteDatasource(Ref ref) {
  return SegmentRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
SegmentRepository segmentRepository(Ref ref) {
  return SegmentRepository(ref.watch(segmentRemoteDatasourceProvider));
}
