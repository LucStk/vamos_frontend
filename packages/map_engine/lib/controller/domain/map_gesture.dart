import 'package:map_engine/visual/visual.dart';

sealed class MapGesture {
  const MapGesture(this.element);

  final MapObject? element;
}

class TapGesture extends MapGesture {
  const TapGesture(super.element);
}

class DoubleTapGesture extends MapGesture {
  const DoubleTapGesture(super.element);
}

class DragStartGesture extends MapGesture {
  const DragStartGesture(super.element);
}

class DraggingGesture extends MapGesture {
  const DraggingGesture(super.element);
}

class DragEndGesture extends MapGesture {
  const DragEndGesture(super.element);
}
