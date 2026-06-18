import 'package:flutter/cupertino.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';

extension TopologyUiElementAdapter on TopologyUiElement {
  Widget build(Id<Trip> tripId, MapCtrl ctrl) {
    return switch (this) {
      VertexElement e => buildVertexWidget(e.vertex, tripId, ctrl),

      SegmentMarkerElement e => buildSegmentMarkerWidget(
        e.marker,
        tripId,
        ctrl,
      ),
    };
  }
}
