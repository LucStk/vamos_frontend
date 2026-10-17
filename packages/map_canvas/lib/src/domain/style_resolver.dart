import "map_paint_context.dart";

abstract interface class Lerpable<T> {
  T lerp(T other, double t);
}

final class StyleResolver<L extends Lerpable<L>> {
  const StyleResolver(this.lookOf);

  final L Function(MapObjectVisualState state) lookOf;

  L resolve(MapPaintContext c) {
    final to = lookOf(c.state);
    if (c.t >= 1) return to;

    final prev = c.previous;
    if (prev == null) {
      if (c.from == c.state) return to; // pas de transition en cours
      return lookOf(c.from).lerp(to, c.t);
    }
    // Départ = look figé de la transition interrompue.
    return resolve(prev).lerp(to, c.t);
  }
}
