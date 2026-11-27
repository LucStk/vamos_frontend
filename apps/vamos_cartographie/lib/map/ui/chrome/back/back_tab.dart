import 'package:material_ui/material_ui.dart';
import 'package:vamos_cartographie/map/ui/chrome/bar_tab.dart';

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
