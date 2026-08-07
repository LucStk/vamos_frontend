// lib/editor/segment_editor.dart
import 'package:domain_core/domain/collection_store.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';

extension SegmentEditor on MapEditor {
  Future<void> deleteSelectedSegment() async {
    if (selection.segmentIdOrNull case final segmentId?) {
      await runEffect(DeleteSegment(segmentId));
      selection = NoSelection();
    }
  }

  Future<void> changeSegmentType(MobilityType type) async {
    if (selection.segmentIdOrNull case final segmentId?) {
      final newSeg = graphEditor.state.segmentStore.get(segmentId)?.current;
      if (newSeg == null) return;
      final draft = SegmentPatchModel.fromFields(
        newSeg,
      ).copyWith(mobilityType: type);
      await graphEditor.updateSegment(draft);
    }
  }

  Future<void> redrawSegment(SegmentId segmentId) async {
    // await runEffect(redrawSegment(segmentId));
  }
  Future<void> segmentCreated(SegmentId segmentId) async {
    selection = SegmentSelection(segmentId: segmentId);
  }
}
