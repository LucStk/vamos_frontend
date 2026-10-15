import 'package:flutter/material.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/point_menu_shell.dart';

@Dependencies([modeOverlay])
class SketchPencilMenuWidget extends StatelessWidget {
  const SketchPencilMenuWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PointMenuShell(
      child: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add, size: 18),
        label: const Text('Créer étape ici'),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
