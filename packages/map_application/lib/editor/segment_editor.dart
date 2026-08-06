// lib/editor/segment_editor.dart
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'entities/entities.dart';
import 'map_editor.dart';

extension SegmentEditor on MapEditor {
  Future<void> deleteSelectedSegment() async {
    if (selection.segmentIdOrNull case final segmentId?) {
      await runEffect(DeleteSegment(segmentId));
      selection = NoSelection();
    }
  }

  Future<void> changeSegmentType(MobilityType type) async {
    // logique métier directement ici
  }

  Future<void> redrawSegment(SegmentId segmentId) async {
    // await runEffect(redrawSegment(segmentId));
  }
}
