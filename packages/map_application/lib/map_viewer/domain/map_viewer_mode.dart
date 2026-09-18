import 'package:map_engine/visual/domain/domain.dart';

abstract class MapViewerMode {
  const MapViewerMode();
  MapObject? get selection;

  MapViewerMode withSelection(MapObject? selection);
}

final class Idle extends MapViewerMode {
  const Idle({this.selection});
  @override
  final MapObject? selection;

  @override
  Idle withSelection(MapObject? selection) => Idle(selection: selection);
}
