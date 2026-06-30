// application/translator/map_translator.dart

import 'package:map_application/map_application.dart';

List<MapIntents> translate(MapUiEvent event, MapState state) {
  return switch (event) {
    MapTapped e => [PutCursor(e.latLng)],
    CursorTapped e => [CreateSimpleVertex(e.latLng)],
    _ => [],
  };
}
