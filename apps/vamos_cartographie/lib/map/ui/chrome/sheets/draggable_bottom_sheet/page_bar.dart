import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet/bar_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';

/// Barre d'icônes en bas de l'écran, à la manière d'un bottomNavigationBar :
/// une icône par page, puis le bouton qui masque la sheet.
class PageBar extends StatelessWidget {
  const PageBar({
    super.key,
    required this.pages,
    required this.page,
    required this.hidden,
    required this.showHide,
    required this.onSelect,
    required this.onToggleHidden,
  });

  final List<SheetPage> pages;
  final ValueListenable<int> page;
  final ValueListenable<bool> hidden;
  final bool showHide;
  final ValueChanged<int> onSelect;
  final VoidCallback onToggleHidden;

  static const double height = 48;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: Listenable.merge([page, hidden]),
      builder: (context, _) {
        final isHidden = hidden.value;
        final current = page.value;
        final showPages = pages.length > 1;

        return Container(
          height: height,
          decoration: BoxDecoration(
            // Filet uniquement quand la barre est collée à la sheet.
            border: isHidden
                ? null
                : Border(
                    top: BorderSide(color: scheme.outlineVariant, width: 0.5),
                  ),
          ),
          child: Row(
            children: [
              if (showPages)
                for (var i = 0; i < pages.length; i++)
                  Expanded(
                    child: BarTab(
                      icon: pages[i].icon,
                      selectedIcon: pages[i].selectedIcon,
                      label: pages[i].label,
                      // Masquée : aucune page n'est "active".
                      selected: !isHidden && i == current,
                      onTap: () => onSelect(i),
                    ),
                  ),
              if (showHide) ...[
                if (showPages)
                  SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 0.5,
                      color: scheme.outlineVariant,
                    ),
                  ),
                SizedBox(
                  width: showPages ? 64 : null,
                  child: BarTab(
                    icon: Icons.visibility_off_outlined,
                    selectedIcon: Icons.visibility_off,
                    label: isHidden
                        ? 'Afficher le panneau'
                        : 'Masquer le panneau',
                    selected: isHidden,
                    onTap: onToggleHidden,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
