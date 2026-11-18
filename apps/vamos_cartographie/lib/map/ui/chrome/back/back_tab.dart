import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet/bar_tab.dart';

/// Onglet « Retour » pour la barre de la sheet (`barLeading`).
class BackTab extends StatelessWidget {
  const BackTab({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => BarTab(
    icon: Icons.adaptive.arrow_back, // flèche Android, chevron iOS
    selectedIcon: Icons.adaptive.arrow_back,
    label: 'Retour',
    selected: false,
    onTap: onTap,
  );
}
