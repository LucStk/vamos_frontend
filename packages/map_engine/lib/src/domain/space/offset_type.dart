import 'dart:ui';

sealed class OffsetType {
  const OffsetType(this.value);

  final Offset value;

  double get dx => value.dx;
  double get dy => value.dy;
}

final class ScreenOffset extends OffsetType {
  const ScreenOffset(super.value);

  ScreenOffset operator +(ScreenOffset other) =>
      ScreenOffset(value + other.value);

  ScreenOffset operator -(ScreenOffset other) =>
      ScreenOffset(value - other.value);
}

final class WorldOffset extends OffsetType {
  const WorldOffset(super.value);

  WorldOffset operator +(WorldOffset other) => WorldOffset(value + other.value);

  WorldOffset operator -(WorldOffset other) => WorldOffset(value - other.value);
}
