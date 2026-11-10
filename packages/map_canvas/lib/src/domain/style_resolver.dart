import 'package:map_canvas/src/domain/domain.dart';
import 'package:map_canvas/src/domain/visual_trait.dart';

abstract interface class Lerpable<T> {
  T lerp(T other, double t);
}

/// Compose un look à partir d'un look de base et d'un look cible par trait.
///
/// Les traits sont appliqués dans l'ordre de [VisualTrait.values], chacun par
/// un lerp pondéré : `look = look.lerp(traits[t], poids(t))`.
/// Un trait sans look déclaré n'a aucun effet visuel.
final class StyleResolver<L extends Lerpable<L>> {
  const StyleResolver({required this.base, required this.traits});

  final L base;
  final Map<VisualTrait, L> traits;

  L resolve(MapPaintContext context) {
    final weights = context.weights;
    var look = base;
    for (final trait in VisualTrait.values) {
      final target = traits[trait];
      if (target == null) continue;
      final k = weights[trait];
      if (k > 0) look = look.lerp(target, k);
    }
    return look;
  }
}
