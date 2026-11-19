import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/context_menu_shell.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/menu_button.dart';

class TripOriginMenuWidget extends StatelessWidget {
  const TripOriginMenuWidget({super.key, required this.prependRoute});
  final VoidCallback prependRoute;

  @override
  Widget build(BuildContext context) {
    return ContextMenuShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MenuButton(
            icon: Icons.pan_tool,
            label: 'Rajouter une Route avant',
            onPressed: prependRoute,
          ),
          // MenuButton(icon: Icons.open_with, label: 'Déplacer', onPressed: move),
        ],
      ),
    );
  }
}
