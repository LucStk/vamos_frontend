import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/map_editor.dart';
import 'package:map_application/effects/map_effects.dart';
import '/editor/entities/entities.dart';

extension TapEditor on MapEditor {
  bool awaitsDoubleTap(MapElement element) => switch (element) {
    NoMapElement() => true, // seul le vide bénéficie du double tap (zoom)
    _ => false, // tout le reste réagit immédiatement
  };

  Future<void> onTapped(MapElement element, LatLng latLng) async {
    switch ((mode, element)) {
      case (Idle _, NoMapElement _):
        selection = MapSelection.none();

      case (Idle _, MapCursor _):
        mode = Idle();
        selection = MapSelection.none();

      case (Idle _, MapSegment e):
        selection = SegmentSelection(segmentId: e.segmentId);

      case (Idle _, MapVertex e):
        selection = MapSelection.vertex(vertex: e.vertex);

      case _:
    }
  }

  Future<void> onDoubleTapped(MapElement element, LatLng latLng) async {
    switch (element) {
      case NoMapElement _:
        await runEffect(ZoomOnPoint(latLng));

      case _:
    }
  }
}
