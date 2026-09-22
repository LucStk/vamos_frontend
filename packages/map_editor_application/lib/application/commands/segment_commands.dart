import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';

sealed class SegmentCommand extends MapCommand {
  const SegmentCommand();
}

final class CreateSegmentFromSketch extends SegmentCommand {
  const CreateSegmentFromSketch({
    required this.startVertexId,
    required this.geometry,
    required this.mobilityType,
    this.endVertexId,
  });

  final VertexId startVertexId;
  final VertexId? endVertexId;
  final List<LatLng> geometry;
  final MobilityType mobilityType;
}

final class SpliceSegment extends SegmentCommand {
  const SpliceSegment({
    required this.segmentId,
    required this.correction,
    required this.startAnchor,
    required this.endAnchor,
  });

  final SegmentId segmentId;
  final List<LatLng> correction;
  final SpliceAnchor startAnchor;
  final SpliceAnchor endAnchor;
}

final class EditSegmentFromSketch extends SegmentCommand {
  const EditSegmentFromSketch(this.patch);
  final SegmentPatchModel patch;
}

final class CorrectSegmentFromSketch extends SegmentCommand {
  const CorrectSegmentFromSketch({
    required this.segmentId,
    required this.correction,
  });

  final SegmentId segmentId;
  final List<LatLng> correction;
}

final class ChangeSelectedSegmentType extends SegmentCommand {
  const ChangeSelectedSegmentType(this.segmentId, this.mobilityType);
  final SegmentId segmentId;
  final MobilityType mobilityType;
}

final class DeleteSegment extends SegmentCommand {
  const DeleteSegment(this.segmentId);
  final SegmentId segmentId;
}
