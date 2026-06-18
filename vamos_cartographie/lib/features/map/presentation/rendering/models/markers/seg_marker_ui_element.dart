part of "marker_ui_element.dart";

class SegMarkerUiElement extends MarkerUiElement {
  final Segment segment;

  const SegMarkerUiElement(super.tripId, this.segment);

  @override
  LatLng get latLng {
    // Compute center of segment geometry
    if (segment.geometry.isEmpty) {
      return const LatLng(0, 0);
    }
    final minLat = segment.geometry
        .map((p) => p.latitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLat = segment.geometry
        .map((p) => p.latitude)
        .reduce((a, b) => a > b ? a : b);
    final minLng = segment.geometry
        .map((p) => p.longitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLng = segment.geometry
        .map((p) => p.longitude)
        .reduce((a, b) => a > b ? a : b);
    return LatLng((minLat + maxLat) / 2, (minLng + maxLng) / 2);
  }

  @override
  Widget buildMarker({bool isDragging = false}) =>
      CursorMarker(tripId: tripId, isDragging: isDragging);

  @override
  MapUiEvent tapEvent() => SegmentMobilityMarkerTapped(segment.id);

  @override
  MapUiEvent doubleTapEvent() => SegmentMobilityMarkerDoubleTapped(segment.id);
}
