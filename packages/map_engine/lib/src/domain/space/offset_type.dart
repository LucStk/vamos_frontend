import 'dart:ui';

class ScreenOffset {
  const ScreenOffset(this.value);

  final Offset value;

  double get dx => value.dx;
  double get dy => value.dy;
}

class WorldOffset {
  const WorldOffset(this.value);

  final Offset value;

  double get dx => value.dx;
  double get dy => value.dy;
}
