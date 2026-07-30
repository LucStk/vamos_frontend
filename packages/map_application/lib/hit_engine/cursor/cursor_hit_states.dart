part of '../map_hit_state.dart';

class CursorPressed extends PointerDown {
  CursorPressed(super.downPoint);
}

class CursorDragged extends MapHitState {
  const CursorDragged();
}
