// mode just après avoir créé un trip pour poser le premier point
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/shared/origin_placement.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

final class CreateTripMode extends AppMode with OriginPlacement {
  CreateTripMode();
  static Transition<AppMode> switchTo() => Transition.to(CreateTripMode());
}
