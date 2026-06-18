part of "marker_ui_element.dart";

class SegMarkerUiElement extends MarkerUiElement {
  final Segment segment;

  const SegMarkerUiElement(this.segment);

  @override
  LatLng get latLng => segment.mobilityMarkerPosition;

  @override
  Widget buildMarker(Id<Trip> tripId, {bool isDragging = false}) =>
      CursorMarker(tripId: tripId, isDragging: isDragging);

  @override
  MapUiEvent tapEvent() => SegmentMobilityMarkerTapped(segment.id);

  @override
  MapUiEvent doubleTapEvent() => SegmentMobilityMarkerDoubleTapped(segment.id);
}
