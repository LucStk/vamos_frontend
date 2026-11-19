import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/bar_tab.dart';

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
/// ([activeIndex]) et fournit son [panel] ; un tap sur un outil est remonté
/// par [onSelect] (null : fermer l'outil actif).
///
/// Contrairement à `PagedSheet`, rien ne se glisse ni ne se déplie : les
/// actions restent visibles tant que l'outil est actif.
class Toolbox extends StatelessWidget {
  const Toolbox({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onSelect,
    this.panel,
    this.leading,
  });

  final List<ToolboxItem> items;

  /// Outil actif, ou null si aucun.
  final int? activeIndex;

  /// Outil choisi ; null quand on retouche l'outil actif (pour le fermer).
  final ValueChanged<int?> onSelect;

  /// Actions de l'outil actif. Ignoré si aucun outil n'est actif.
  final Widget? panel;

  /// À gauche de la barre (ex. `BackTab`).
  final Widget? leading;

  static const _panelDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final active = activeIndex;
    final panel = active == null ? null : this.panel;
    final leading = this.leading;

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
                            key: ValueKey('tool-$active'),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                              child: panel,
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
