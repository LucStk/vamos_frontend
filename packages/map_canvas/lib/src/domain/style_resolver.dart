// style_resolver.dart
import "map_paint_context.dart";

abstract interface class Lerpable<T> {
  T lerp(T other, double t);
}

/// Donne le look d'un objet pour un contexte de peinture (from, state, t).
final class StyleResolver<L extends Lerpable<L>> {
  /// `lookOf` est un switch exhaustif : le compilateur signale
  /// un nouvel état visuel oublié.
  const StyleResolver(this.lookOf);

  final L Function(MapObjectVisualState state) lookOf;

  L resolve(MapPaintContext c) {
    final to = lookOf(c.state);
    if (c.from == c.state || c.t >= 1) return to; // pas de transition en cours
    return lookOf(c.from).lerp(to, c.t);
  }
}
