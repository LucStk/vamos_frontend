sealed class DragDetail {
  const DragDetail();
}

/// Position continue sur la géométrie de la route (même repère que `startIndex`).
final class RouteDragDetail extends DragDetail {
  const RouteDragDetail(this.position);
  final double position;
}
