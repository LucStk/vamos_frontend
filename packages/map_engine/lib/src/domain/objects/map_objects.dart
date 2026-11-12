abstract class MapObject {
  const MapObject();
  bool get isDraggable => false;
  bool get awaitsDoubleTap => false;
  bool get isHitTestable => true;
  bool get isMovedByDrag => isDraggable;

  /// Peut être « survolé » par un objet en cours de drag.
  /// Faux pour les proxys du pointeur (ex. Pencil).
  bool get isDropTarget => true;
}

abstract interface class Selectable implements MapObject {}
