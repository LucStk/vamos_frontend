import '../objects/map_objects.dart';
import '../space/offset_type.dart';

sealed class MapGesture {
  const MapGesture(this.offset);
  final ScreenOffset offset;
}

class PressGesture extends MapGesture {
  const PressGesture(super.offset, {required this.element});
  final MapObject? element;
}

class TapGesture extends MapGesture {
  const TapGesture(super.offset, {required this.element});
  final MapObject? element;
}

class DoubleTapGesture extends MapGesture {
  const DoubleTapGesture(super.offset, {required this.element});
  final MapObject? element;
}

class LongPressGesture extends MapGesture {
  const LongPressGesture(super.offset, {required this.element});
  final MapObject? element;
}

class SecondaryTapGesture extends MapGesture {
  const SecondaryTapGesture(super.offset, {required this.element});
  final MapObject? element;
}

class DragStartGesture extends MapGesture {
  const DragStartGesture(super.offset, {required this.dragged});
  final MapObject? dragged;
}

class DragUpdateGesture extends MapGesture {
  const DragUpdateGesture(
    super.offset, {
    required this.dragged,
    required this.target,
  });

  final MapObject? dragged;
  final MapObject? target;
}

class DragEndGesture extends MapGesture {
  const DragEndGesture(
    super.offset, {
    required this.dragged,
    required this.target,
  });

  final MapObject? dragged;
  final MapObject? target;
}
