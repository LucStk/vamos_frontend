part of '../view_trip_mode.dart';

mixin IdleViewBehavior on ViewTripMode {
  @override
  Transition<ViewTripMode> onTap(TapGesture g) => switch (g.element) {
    // MapUserLocation _ || null => Transition.to(withPopupPosition(g.offset)),
    MapVertex e => Transition.to(VertexSelectViewMode(vertex: e)),
    MapSegment e => Transition.to(SegmentSelectViewMode(segment: e)),
    _ => Transition.none(),
  };
}

@freezed
final class IdleView extends ViewTripMode with IdleViewBehavior, _$IdleView {
  IdleView();
}
