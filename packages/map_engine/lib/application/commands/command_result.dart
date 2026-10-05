import 'package:trip_application/trip_application.dart';

sealed class CommandResult {
  const CommandResult();
}

/// Rien à répercuter (échec, segment introuvable, vertex créé…)
final class NoResult extends CommandResult {
  const NoResult();
}

final class TripSelected extends CommandResult {
  const TripSelected(this.trip);
  final Trip trip;
}

final class SegmentCreated extends CommandResult {
  const SegmentCreated(this.segment);
  final SegmentFields segment;
}

final class SegmentSpliced extends CommandResult {
  const SegmentSpliced(this.segment);
  final SegmentFields segment;
}

final class SegmentUpdated extends CommandResult {
  const SegmentUpdated(this.segmentId);
  final SegmentId segmentId;
}

final class SegmentCorrected extends CommandResult {
  const SegmentCorrected(this.segmentId);
  final SegmentId segmentId;
}

final class SegmentDeleted extends CommandResult {
  const SegmentDeleted(this.segmentId);
  final SegmentId segmentId;
}

final class VertexRemoved extends CommandResult {
  const VertexRemoved(this.vertexId);
  final VertexId vertexId;
}
