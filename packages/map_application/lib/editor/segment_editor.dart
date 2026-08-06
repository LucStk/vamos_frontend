// lib/editor/segment_editor.dart
import 'package:map_application/domain/domain.dart';
import 'package:map_application/map_application.dart';

import 'map_editor.dart';

extension SegmentEditor on MapEditor {
  Future<void> deleteSelectedSegment() async {
    if (state.selection.segmentIdOrNull case final segmentId?) {
      await sendEffect(DeleteSegment(segmentId));
      state = state.copyWith(selection: NoSelection());
    }
  }

  Future<void> changeSegmentType(MobilityType type) async {
    // logique métier directement ici
  }

  Future<void> redrawSegment(SegmentId segmentId) async {
    await sendEffect(RedrawSegment(segmentId));
  }
}
