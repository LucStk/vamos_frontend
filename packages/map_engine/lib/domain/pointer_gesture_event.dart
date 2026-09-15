import 'dart:ui';

sealed class MapPointerEvent {
  final Offset offset;
  const MapPointerEvent(this.offset);
}

class MapPointerDown extends MapPointerEvent {
  const MapPointerDown(super.offset);
}

class MapPointerMove extends MapPointerEvent {
  const MapPointerMove(super.offset);
}

class MapPointerUp extends MapPointerEvent {
  const MapPointerUp(super.offset);
}
