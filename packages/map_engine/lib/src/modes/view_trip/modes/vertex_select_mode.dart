part of '../view_trip_mode.dart';

@freezed
final class VertexSelectViewMode extends ViewTripMode
    with IdleViewBehavior, _$VertexSelectViewMode {
  VertexSelectViewMode({required this.vertex});

  final MapVertex vertex;
}
