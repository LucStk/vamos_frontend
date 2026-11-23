import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';

/// Un bouton flottant du dock : une icône dans son propre conteneur en relief.
class DockButton extends StatelessWidget {
  const DockButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  static const size = 48.0;

  @override
  Widget build(BuildContext context) => Material(
    elevation: kSheetElevation,
    color: Theme.of(context).colorScheme.surface,
    borderRadius: BorderRadius.circular(20),
    clipBehavior: Clip.antiAlias,
    child: SizedBox.square(
      dimension: size,
      child: IconButton(
        tooltip: tooltip,
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    ),
  );
}
