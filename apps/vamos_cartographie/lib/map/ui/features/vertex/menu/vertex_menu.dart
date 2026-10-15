import 'package:flutter/material.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/object_menu_shell.dart';

import 'package:vamos_cartographie/map/camera/camera_or_null.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/sketch_item_provider.dart';
import 'package:vamos_cartographie/map/scene/items/vertex/vertex_item_provider.dart';

@Dependencies([vertexItem, pencilItem, modeOverlay, CameraOrNull])
class VertexMenuWidget extends StatelessWidget {
  const VertexMenuWidget({
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
    return ObjectMenuShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _MenuButton(
            icon: Icons.route,
            label: 'Tracer depuis ici',
            onPressed: drawFrom,
          ),
          _MenuButton(
            icon: Icons.add_location_alt_outlined,
            label: 'Créer étape ici',
            onPressed: createFrom,
          ),
          _MenuButton(
            icon: Icons.delete_outline,
            label: 'Supprimer le sommet',
            onPressed: delete,
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.foregroundColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
