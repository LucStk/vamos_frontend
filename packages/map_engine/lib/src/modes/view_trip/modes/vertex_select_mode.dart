part of '../view_trip_mode.dart';

@freezed
final class VertexSelectViewMode extends ViewTripMode
    with IdleViewBehavior, _$VertexSelectViewMode {
  VertexSelectViewMode({required this.vertex, this.popUpPosition});

  final MapVertex vertex;

  @override
  final PopUpPositionType popUpPosition;

  @override
  VertexSelectViewMode withPopupPosition(ScreenOffset position) =>
      copyWith(popUpPosition: position);
}
