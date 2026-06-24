import 'package:media_application/patches/upload_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topology_application/read_models/segment_ui_model.dart';
import 'package:vamos_cartographie/core/injection/stores/graph_store.dart';

import 'package:trip_domain/trip_domain.dart';
part 'segment_queries.g.dart';

@riverpod
FutureOr<List<SegmentUiModel>> segments(
  Ref ref,
  TripId tripId,
  SegmentId segId,
) async {
  final segmentStore = await ref.watch(segmentGraphStoreProvider.future);
  final patchStore = await ref.watch(segmentPatchStoreProvider.future);

  return [
    ...segmentStore..map((v) => v.toUiModel()),
    ...patchStore.values.map((v) => v.toUiModel(UploadStatus.success)),
  ];
}
