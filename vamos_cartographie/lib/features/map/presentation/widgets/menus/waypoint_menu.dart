import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/buttons/create_waypoint_button.dart';
import "pop_menu.dart";
import "pop_menu_shell.dart";

class WaypointMenu extends PopMenu {
  const WaypointMenu({super.key, required super.tripId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopMenuShell(
      buttonsBuilder: (ctx) => [CreateWaypointButton(onPressed: () {})],
    );
  }
}
