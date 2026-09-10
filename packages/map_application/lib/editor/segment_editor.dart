// lib/editor/segment_editor.dart
import 'package:domain_core/domain/collection_store.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';

extension SegmentEditor on MapContext {
  Future<void> deleteSelectedSegment() async {
    if (selection case MapSegment(:final id)) {
      await runEffect(DeleteSegment(id));
      selection = null;
    }
  }

  Future<void> changeSegmentType(MobilityType type) async {
    if (selection case MapSegment(:final id)) {
      final newSeg = graphEditor.state.segmentStore.get(id)?.current;
      if (newSeg == null) return;
      final draft = SegmentPatchModel.fromFields(
        newSeg,
      ).copyWith(mobilityType: type);
      await graphEditor.updateSegment(draft);
    }
  }

  Future<void> activateSegmentEditMode() async {
    if (selection case MapSegment(:final id)) {
      final newSeg = graphEditor.state.segmentStore.get(id)?.current;
      if (newSeg == null) return;
      mode = SketchEdition(segment: newSeg);
      selection = null;
    }
  }

  Future<void> deactivateSegmentEditMode() async {
    // await runEffect(redrawSegment(segmentId));
  }
}
