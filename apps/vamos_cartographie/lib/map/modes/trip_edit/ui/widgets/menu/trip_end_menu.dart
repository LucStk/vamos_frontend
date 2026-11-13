import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/context_menu_shell.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/menu_button.dart';

class TripEndMenuWidget extends StatelessWidget {
  const TripEndMenuWidget({super.key, required this.extendRoute});
  final VoidCallback extendRoute;

  @override
  Widget build(BuildContext context) {
    return ContextMenuShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MenuButton(
            icon: Icons.pan_tool,
            label: 'Poursuivre le tracé',
            onPressed: extendRoute,
          ),
        ],
      ),
    );
  }
}
