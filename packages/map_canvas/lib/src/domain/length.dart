// length.dart
sealed class Length {
  const Length(this.value);

  final double value;

  bool get dependsOnZoom => this is ScreenLength;

  double toWorld(double zoomScale) => switch (this) {
    ScreenLength(:final value) => value / zoomScale,
    WorldLength(:final value) => value,
  };

  Length operator +(Length other) => switch ((this, other)) {
    (ScreenLength a, ScreenLength b) => ScreenLength(a.value + b.value),
    (WorldLength a, WorldLength b) => WorldLength(a.value + b.value),
    _ => throw ArgumentError(
      'Impossible d’additionner des longueurs d’unités différentes.',
    ),
  };

  Length operator -(Length other) => switch ((this, other)) {
    (ScreenLength a, ScreenLength b) => ScreenLength(a.value - b.value),
    (WorldLength a, WorldLength b) => WorldLength(a.value - b.value),
    _ => throw ArgumentError(
      'Impossible de soustraire des longueurs d’unités différentes.',
    ),
  };
}

/// Décalage dont chaque composante porte son unité.
final class LengthOffset {
  const LengthOffset(this.dx, this.dy);
  static const zero = LengthOffset(WorldLength(0), WorldLength(0));
  final Length dx, dy;
  bool get dependsOnZoom => dx.dependsOnZoom || dy.dependsOnZoom;
}

/// Taille constante à l'écran, quel que soit le zoom.
final class ScreenLength extends Length {
  const ScreenLength(super.value);
}

/// Dimension physique : grandit avec le zoom.
final class WorldLength extends Length {
  const WorldLength(super.value);
}

extension LengthLiterals on num {
  ScreenLength get px => ScreenLength(toDouble());
  WorldLength get m => WorldLength(toDouble());
}
