part of "events.dart";

sealed class CursorInputEvent extends MapInputEvent {
  const CursorInputEvent();
}

class CursorButtonCreateTapped extends CursorInputEvent {
  const CursorButtonCreateTapped();
}
