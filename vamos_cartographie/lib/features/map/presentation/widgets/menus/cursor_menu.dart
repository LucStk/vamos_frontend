import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:vamos_cartographie/features/map/application/providers/cursor_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/buttons/create_waypoint_button.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/menus/pop_menu_shell.dart';
import 'package:vamos_cartographie/features/waypoints/presentation/dialogs/waypoint_creator_dialog.dart';
import "pop_menu.dart";

class CursorMenu extends PopMenu {
  const CursorMenu({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cursor = ref.watch(mapCursorProvider);
    final cursorNotifier = ref.watch(mapCursorProvider.notifier);
    return PopMenuShell(
      buttonsBuilder: (ctx) => [
        CreateWaypointButton(
          onPressed: () async {
            WaypointCreatorDialog.show(
              context: context,
              tripId: tripId,
              latLng: cursor.latLng,
            );
            cursorNotifier.close();
          },
        ),
      ],
    );
  }
}
