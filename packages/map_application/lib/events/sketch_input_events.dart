part of "events.dart";

sealed class SketchInputEvent extends MapInputEvent {
  const SketchInputEvent();
}

class SketchPencilDraggedStart extends SketchInputEvent {}

class SketchModeActivate extends SketchInputEvent {
  const SketchModeActivate();
}

class SketchModeDeactivate extends SketchInputEvent {
  const SketchModeDeactivate();
}

class SketchCancelButtonTapped extends SketchInputEvent {
  const SketchCancelButtonTapped();
}

class PencilButtonCreateTapped extends SketchInputEvent {
  const PencilButtonCreateTapped();
}
