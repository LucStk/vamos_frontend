import 'package:flutter/material.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/context_menu_shell.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/menu_button.dart';

@Dependencies([modeOverlay])
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
