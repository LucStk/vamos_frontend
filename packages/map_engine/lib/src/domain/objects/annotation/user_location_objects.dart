import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';

final class MapLocalization extends MapObject {
  final double accuracy;
  final double heading;

  /// Où se trouve la position de l'utilisateur : c'est là que se pose le
  /// curseur quand on la touche, et non à l'endroit exact du tap.
  final WorldOffset position;
  const MapLocalization({
    required this.accuracy,
    required this.heading,
    required this.position,
  });

  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}
