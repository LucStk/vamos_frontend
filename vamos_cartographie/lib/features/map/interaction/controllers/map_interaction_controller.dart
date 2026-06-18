import '../machine/map_mode.dart';
import '../overlay/cursor_state.dart';
import '../overlay/popup_state.dart';

class MapInteractionState {
  final MapMode mode;
  final MapCursorState? cursor;
  final MapPopupState? popup;

  const MapInteractionState({required this.mode, this.cursor, this.popup});

  factory MapInteractionState.initial() {
    return MapInteractionState(mode: const MapMode.idle());
  }

  MapInteractionState copyWith({
    MapMode? mode,
    MapCursorState? cursor,
    MapPopupState? popup,
  }) {
    return MapInteractionState(
      mode: mode ?? this.mode,
      cursor: cursor ?? this.cursor,
      popup: popup ?? this.popup,
    );
  }
}
