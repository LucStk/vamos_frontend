import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/context_menu_shell.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/menu_button.dart';

class TripOriginMenuWidget extends StatelessWidget {
  const TripOriginMenuWidget({
    super.key,
    required this.prependRoute,
    required this.extendRoute,
    required this.move,
  });
  final VoidCallback prependRoute;
  final VoidCallback extendRoute;
  final VoidCallback move;

  @override
  Widget build(BuildContext context) {
    return ContextMenuShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MenuButton(
            icon: Icons.gesture,
            label: 'Dessiner une route',
            onPressed: extendRoute,
          ),

          MenuButton(icon: Icons.open_with, label: 'Déplacer', onPressed: move),
        ],
      ),
    );
  }
}
