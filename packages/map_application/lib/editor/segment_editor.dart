// lib/editor/segment_editor.dart
import 'package:domain_core/domain/collection_store.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';

extension SegmentEditor on MapEditor {
  Future<void> deleteSelectedSegment() async {
    if (selection case MapSegment(:final segment)) {
      await runEffect(DeleteSegment(segment.id));
      selection = NoMapElement();
    }
  }

  Future<void> changeSegmentType(MobilityType type) async {
    if (selection case MapSegment(:final segment)) {
      final newSeg = graphEditor.state.segmentStore.get(segment.id)?.current;
      if (newSeg == null) return;
      final draft = SegmentPatchModel.fromFields(
        newSeg,
      ).copyWith(mobilityType: type);
      await graphEditor.updateSegment(draft);
    }
  }

  Future<void> activateSegmentEditMode() async {
    if (selection case MapSegment(:final segment)) {
      final newSeg = graphEditor.state.segmentStore.get(segment.id)?.current;
      if (newSeg == null) return;
      mode = SketchEdition(segment: newSeg);
      selection = NoMapElement();
    }
  }

  Future<void> deactivateSegmentEditMode() async {
    // await runEffect(redrawSegment(segmentId));
  }
  Future<void> segmentCreated(SegmentFields segment) async {
    selection = MapSegment(segment);
  }

  Future<void> segmentEdited(SegmentFields segment) async {
    // selection = SegmentSelection(segmentId: segmentId);
  }
}
