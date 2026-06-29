// application/translator/map_translator.dart
import 'package:vamos_cartographie/features/map_editor/events/ui_events.dart';
import 'package:vamos_cartographie/features/map_editor/intents/intents.dart';
import 'package:vamos_cartographie/features/map_editor/domain/domain.dart';

List<MapIntents> translate(MapUiEvent event, MapState state) {
  return switch (event) {
    MapTapped e => [PutCursor(e.latLng)],
    _ => [],
  };
}
