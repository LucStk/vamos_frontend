import 'package:map_application/domain/map_elements.dart';

sealed class MapElementState {
  const MapElementState();
}

class EmptyState extends MapElementState {
  const EmptyState();
}

class Pressed extends MapElementState {
  final MapElement element;
  const Pressed(this.element);
}

class Dragging extends MapElementState {
  final MapElement element;
  const Dragging({required this.element});
}
