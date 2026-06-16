import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/buttons/create_waypoint_button.dart';
import "pop_up_shell.dart";
import "pop_up_abstract.dart";

class VertexPopUp extends AbstractPopUp {
  const VertexPopUp({super.key, required super.tripId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopUpShell(
      buttonsBuilder: (ctx) => [CreateWaypointButton(onPressed: () {})],
    );
  }
}
