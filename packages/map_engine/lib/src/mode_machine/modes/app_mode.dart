import 'package:map_engine/src/mode_machine/mode.dart';

import 'package:map_engine/src/mode_machine/overlay.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:map_engine/src/mode_machine/mode_state.dart';

typedef AppTransition = Transition<AppMode>;
typedef AppModeState = ModeState<AppMode>;
typedef AppOverlay =
    Overlay<
      AppMode
    >; // évite aussi le conflit avec le widget Overlay de Flutter

abstract class AppMode extends Mode<AppMode> {
  const AppMode();
}
