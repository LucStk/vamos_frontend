part of '../view_trip_mode.dart';

mixin IdleViewBehavior on ViewTripMode {
  ViewTripMode withPopupPosition(ScreenOffset position);

  @override
  GestureResult<ViewTripMode> onTap(TapGesture g) => switch (g.element) {
    MapUserLocation _ || null => GestureResult.to(withPopupPosition(g.offset)),
    MapVertex e => GestureResult.to(VertexSelectViewMode(vertex: e)),
    MapSegment e => GestureResult.to(SegmentSelectViewMode(segment: e)),
    _ => GestureResult.none(),
  };
}

@freezed
final class IdleView extends ViewTripMode with IdleViewBehavior, _$IdleView {
  IdleView({this.popUpPosition});

  @override
  final PopUpPositionType popUpPosition;

  @override
  IdleView withPopupPosition(ScreenOffset position) =>
      copyWith(popUpPosition: position);
}
