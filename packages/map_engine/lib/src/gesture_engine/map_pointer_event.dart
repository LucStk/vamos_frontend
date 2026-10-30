import 'package:domain_core/space/offset_type.dart';

enum PointerButton { primary, secondary }

class PointerPosition {
  const PointerPosition({required this.screen, required this.world});

  final ScreenOffset screen;
  final WorldOffset world;
}

sealed class PointerEvent {
  const PointerEvent(this.position);

  final PointerPosition position;

  ScreenOffset get screen => position.screen;
  WorldOffset get world => position.world;
}

sealed class PointerButtonEvent extends PointerEvent {
  const PointerButtonEvent(super.position, this.button);

  final PointerButton button;
}

final class PointerDown extends PointerButtonEvent {
  const PointerDown(super.position, super.pointerButton);
}

final class PointerMove extends PointerEvent {
  const PointerMove(super.position);
}

final class PointerUp extends PointerEvent {
  const PointerUp(super.position);
}

final class PointerCancel extends PointerEvent {
  const PointerCancel(super.position);
}

final class PointerTapTimeout extends PointerEvent {
  const PointerTapTimeout(super.position);
}

final class PointerLongPressTimeout extends PointerEvent {
  const PointerLongPressTimeout(super.position);
}
