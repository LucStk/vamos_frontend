import 'package:map_engine/src/domain/objects/map_objects.dart';

final class MapSearchResult extends MapObject {
  const MapSearchResult();

  @override
  bool get isDraggable => false;

  @override
  bool operator ==(Object other) => other is MapSearchResult;
  @override
  int get hashCode => (MapSearchResult).hashCode;
}
