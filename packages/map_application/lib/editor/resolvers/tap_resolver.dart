import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/map_editor.dart';
import 'package:map_application/effects/map_effects.dart';
import '/editor/entities/entities.dart';

extension TapEditor on MapEditor {
  Future<void> onTapped(MapElement element, LatLng latLng) async {
    switch ((mode, element)) {
      case (Idle _, NoMapElement _):
        selection = NoMapElement();

      case (Idle _, MapCursor _):
        mode = Idle();
        selection = NoMapElement();

      case (Idle _, MapSegment e):
        selection = e;

      case (Idle _, MapVertex e):
        selection = e;

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
