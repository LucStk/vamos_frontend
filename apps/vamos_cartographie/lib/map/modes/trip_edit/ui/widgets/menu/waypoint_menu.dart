import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/context_menu_shell.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/menu_button.dart';

class WaypointMenuWidget extends StatelessWidget {
  const WaypointMenuWidget({
    super.key,
    required this.drawFrom,
    required this.createFrom,
    required this.delete,
    required this.move,
  });

  final VoidCallback drawFrom;
  final VoidCallback createFrom;
  final VoidCallback delete;
  final VoidCallback move;

  @override
  Widget build(BuildContext context) {
    return ContextMenuShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MenuButton(
            icon: Icons.route,
            label: 'Tracer depuis',
            onPressed: drawFrom,
          ),
          MenuButton(
            icon: Icons.add_location_alt_outlined,
            label: 'Créer',
            onPressed: createFrom,
          ),
          MenuButton(
            icon: Icons.delete_outline,
            label: 'Effacer',
            onPressed: delete,
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
    );
  }
}
