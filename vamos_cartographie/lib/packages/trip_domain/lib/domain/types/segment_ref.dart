// Dans trip_domain — type union simple
import 'package:domain_core/id.dart';
import 'package:trip_domain/domain/entities/entities.dart';

sealed class SegmentRef {
  const SegmentRef();
}

class ConfirmedSegmentRef extends SegmentRef {
  final Id<Segment> id;
  const ConfirmedSegmentRef(this.id);
}

class PendingSegmentRef extends SegmentRef {
  final Id<SegmentPatch> id;
  const PendingSegmentRef(this.id);
}
