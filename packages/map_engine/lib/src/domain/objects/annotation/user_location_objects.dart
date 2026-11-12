import 'package:map_engine/src/domain/objects/map_objects.dart';

final class MapLocalization extends MapObject implements Selectable {
  final double accuracy;
  final double heading;
  const MapLocalization({required this.accuracy, required this.heading});

  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}
