// map_engine : domain/overlay/anchor_locator.dart
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';

final class AnchorLocator {
  AnchorLocator();

  final _byType = <Type, WorldOffset? Function(MapObject)>{};

  AnchorLocator register<T extends MapObject>(WorldOffset? Function(T) f) {
    _byType[T] = (o) => f(o as T);
    return this;
  }

  /// null si le type n'est pas enregistré ou si l'objet n'existe plus.
  WorldOffset? worldPositionOf(MapObject o) => _byType[o.runtimeType]?.call(o);
}
