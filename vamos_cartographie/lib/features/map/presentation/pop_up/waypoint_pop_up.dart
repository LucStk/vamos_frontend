import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/buttons/create_waypoint_button.dart';
import 'package:vamos_cartographie/features/map/presentation/buttons/start_segment_button.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/pop_up_abstract.dart';
import "pop_up_abstract.dart";
import "pop_up_shell.dart";

class WaypointPopUp extends AbstractPopUp {
  const WaypointPopUp({super.key, required super.tripId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopUpShell(
      buttonsBuilder: (ctx) => [
        CreateWaypointButton(onPressed: () {}),
        StartSegmentButton(onPressed: () {}),
      ],
    );
  }
}
