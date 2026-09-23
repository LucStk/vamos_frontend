enum MapObjectVisualState { normal, selected, hovered, dragging }

class MapPaintContext {
  final MapObjectVisualState state;

  const MapPaintContext({this.state = MapObjectVisualState.normal});
}
