import 'package:domain_core/domain_core.dart';
import 'package:trip_application/topology/domain/domain.dart';

extension SegmentDisplayX on NodeState<SegmentFields> {
  SegmentFields get display => switch (this) {
    HasValue(value: final v) => v,
    HasPatch(patch: final p) => p as SegmentFields,
  };
}

typedef SegmentState = NodeState<SegmentFields>;
