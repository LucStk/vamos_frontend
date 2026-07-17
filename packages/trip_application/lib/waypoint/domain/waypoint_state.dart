import 'package:domain_core/domain_core.dart';
import 'package:trip_application/waypoint/domain/domain.dart';

extension WaypointDisplayX on NodeState<WaypointFields> {
  WaypointFields get display => switch (this) {
    HasValue(value: final v) => v,
    HasPatch(patch: final p) => p as WaypointFields,
  };
}

typedef WaypointState = NodeState<WaypointFields>;
