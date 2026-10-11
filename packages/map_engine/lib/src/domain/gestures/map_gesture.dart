import '../../input/map_pointer_event.dart';
import '../objects/map_objects.dart';
import '../space/offset_type.dart';

sealed class MapGesture {
  const MapGesture(this.position);
  final PointerPosition position;
  WorldOffset get world => position.world;
  ScreenOffset get screen => position.screen;
}

class PressGesture extends MapGesture {
  const PressGesture(super.position, {required this.element});
  final MapObject? element;
}

class TapGesture extends MapGesture {
  const TapGesture(super.position, {required this.element});
  final MapObject? element;
}

class DoubleTapGesture extends MapGesture {
  const DoubleTapGesture(super.position, {required this.element});
  final MapObject? element;
}

class LongPressGesture extends MapGesture {
  const LongPressGesture(super.position, {required this.element});
  final MapObject? element;
}

class SecondaryTapGesture extends MapGesture {
  const SecondaryTapGesture(super.position, {required this.element});
  final MapObject? element;
}

class DragStartGesture extends MapGesture {
  const DragStartGesture(super.position, {required this.dragged});
  final MapObject? dragged;
}

class DragUpdateGesture extends MapGesture {
  const DragUpdateGesture(
    super.position, {
    required this.dragged,
    required this.target,
  });

  final MapObject? dragged;
  final MapObject? target;
}

class DragEndGesture extends MapGesture {
  const DragEndGesture(
    super.position, {
    required this.dragged,
    required this.target,
  });

  final MapObject? dragged;
  final MapObject? target;
}

final class DragCancelGesture extends MapGesture {
  const DragCancelGesture(super.position, {required this.dragged});
  final MapObject? dragged;
}
