import 'dart:ui';

class ScreenOffset {
  const ScreenOffset(this.value);

  final Offset value;

  double get dx => value.dx;
  double get dy => value.dy;

  ScreenOffset operator +(ScreenOffset other) =>
      ScreenOffset(value + other.value);

  ScreenOffset operator -(ScreenOffset other) =>
      ScreenOffset(value - other.value);
}

class WorldOffset {
  const WorldOffset(this.value);

  final Offset value;

  double get dx => value.dx;
  double get dy => value.dy;

  WorldOffset operator +(WorldOffset other) => WorldOffset(value + other.value);

  WorldOffset operator -(WorldOffset other) => WorldOffset(value - other.value);
}
