import 'package:material_ui/material_ui.dart';
import 'package:vamos_cartographie/map/ui/chrome/bar_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Un outil de la barre : son icône et son libellé.
class ToolboxItem {
  const ToolboxItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final String label;
}

/// Boîte à outils en bas de l'écran : une barre d'outils, et au-dessus le
/// panneau d'actions de l'outil actif.
///
/// Ne connaît ni les modes ni Riverpod : le parent dit quel outil est actif
/// ([activeIndex]) et fournit le [panel] à afficher ; un tap sur un outil est
/// remonté par [onSelect] (null : fermer l'outil actif).
///
/// Le panneau peut exister sans outil actif (panneau contextuel, ouvert par
/// un geste sur la carte par exemple) : aucun onglet n'est alors allumé.
///
/// Rien ne se glisse ni ne se déplie ici : les
/// actions restent visibles tant que le panneau est là.
class Toolbox extends StatelessWidget {
  const Toolbox({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onSelect,
    this.panel,
    this.panelKey,
    this.leading,
    this.onClose,
  });

  final List<ToolboxItem> items;

  /// Outil actif, ou null si aucun.
  final int? activeIndex;

  /// Outil choisi ; null quand on retouche l'outil actif (pour le fermer).
  final ValueChanged<int?> onSelect;

  /// Panneau affiché au-dessus de la barre, ou null pour aucun.
  final Widget? panel;

  /// Identité du panneau : la changer remplace le panneau en fondu, la
  /// garder le met simplement à jour. Par défaut, l'outil actif.
  final Object? panelKey;

  /// À gauche de la barre (ex. `BackTab`).
  final Widget? leading;

  /// Sortie du mode : chaque `ToolPanel` du panneau en fait une croix à
  /// droite. Null : pas de croix.
  final VoidCallback? onClose;

  static const _panelDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final active = activeIndex;
    final panel = this.panel;
    final leading = this.leading;
    final onClose = this.onClose;

    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
        child: Material(
          elevation: kSheetElevation,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          clipBehavior: Clip.antiAlias,
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Panneau : s'ouvre / se referme en douceur, et change de
                // contenu en fondu quand on change d'outil.
                AnimatedSize(
                  duration: _panelDuration,
                  curve: Curves.easeOutCubic,
                  alignment: Alignment.bottomCenter,
                  child: AnimatedSwitcher(
                    duration: _panelDuration,
                    child: panel == null
                        ? const SizedBox(
                            key: ValueKey('none'),
                            width: double.infinity,
                          )
                        : KeyedSubtree(
                            key: ValueKey(panelKey ?? ('tool', active)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                              child: onClose == null
                                  ? panel
                                  : ToolPanelScope(
                                      onClose: onClose,
                                      child: panel,
                                    ),
                            ),
                          ),
                  ),
                ),
                if (panel != null)
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: scheme.outlineVariant,
                  ),
                SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      if (leading != null) ...[
                        SizedBox(width: 64, child: leading),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 1,
                            thickness: 0.5,
                            color: scheme.outlineVariant,
                          ),
                        ),
                      ],
                      for (var i = 0; i < items.length; i++)
                        Expanded(
                          child: BarTab(
                            icon: items[i].icon,
                            selectedIcon: items[i].selectedIcon,
                            label: items[i].label,
                            selected: i == active,
                            // Retoucher l'outil actif le ferme.
                            onTap: () => onSelect(i == active ? null : i),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
