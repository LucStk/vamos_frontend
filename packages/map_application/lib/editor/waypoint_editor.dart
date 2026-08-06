// lib/editor/segment_editor.dart
import 'package:map_application/map_application.dart';
import 'entities/entities.dart';
import 'map_editor.dart';

extension WaypointEditor on MapEditor {
  Future<void> createWaypointAtCursor() async {
    if (selection.cursorLatLngOrNull case final latLng?) {
      selection = NoSelection();
      await runEffect(CreateWaypointFromPosition(latLng));
    }
  }
}
