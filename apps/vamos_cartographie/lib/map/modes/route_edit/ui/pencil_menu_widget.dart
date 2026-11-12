import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/context_menu_shell.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/menu_button.dart';

// import 'package:riverpod_annotation/experimental/scope.dart';
// import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';

// @Dependencies([modeOverlay])
class PencilMenuWidget extends StatelessWidget {
  const PencilMenuWidget({super.key, required this.endSketch});
  final VoidCallback endSketch;

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
            label: 'Validate',
            onPressed: endSketch,
          ),
        ],
      ),
    );
  }
}
