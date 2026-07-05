// application/translator/map_translator.dart

import 'package:map_application/map_application.dart';

List<MapIntents> translate(MapUiEvent event, MapState state) {
  switch (event) {
    case MapTapped e:
      return [PutCursor(e.latLng)];
    case CursorTapped e:
      return [CreateSimpleVertex(e.latLng)];
    case VertexDragEnd e:
      return [UpdateVertexPosition(e.vertexRef, e.latLng)];
    default:
      return [];
  }
}
