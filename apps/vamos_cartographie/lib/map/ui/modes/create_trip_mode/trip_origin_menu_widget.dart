import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/context_menu_shell.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/menu_button.dart';

class TripOriginMenuWidget extends StatelessWidget {
  const TripOriginMenuWidget({super.key, required this.createFrom});

  final VoidCallback createFrom;

  @override
  Widget build(BuildContext context) {
    return ContextMenuShell(
      maxWidth: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MenuButton(
            icon: Icons.add_location_alt_outlined,
            label: 'Start ici',
            onPressed: createFrom,
          ),
        ],
      ),
    );
  }
}
