import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet/bar_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet/sheet_page.dart';

/// Barre d'icônes en bas de l'écran, à la manière d'un bottomNavigationBar :
/// un éventuel [leading] (retour), puis une icône par page.
///
/// Sheet masquée (glissée vers le bas) : toucher un onglet la ré-affiche.
class PageBar extends StatelessWidget {
  const PageBar({
    super.key,
    required this.pages,
    required this.page,
    required this.hidden,
    required this.onSelect,
    this.leading,
  });

  final List<SheetPage> pages;
  final ValueListenable<int> page;
  final ValueListenable<bool> hidden;
  final ValueChanged<int> onSelect;

  /// Affiché à gauche de la barre (ex. bouton retour du mode).
  final Widget? leading;

  static const double height = 48;

  static const double _leadingWidth = 64;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: Listenable.merge([page, hidden]),
      builder: (context, _) {
        final isHidden = hidden.value;
        final current = page.value;
        // Une seule page : son onglet n'apparaît que sheet masquée, pour
        // pouvoir la ré-afficher.
        final showPages = pages.length > 1 || (isHidden && pages.isNotEmpty);
        final leading = this.leading;

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
              if (leading != null)
                if (showPages) ...[
                  SizedBox(width: _leadingWidth, child: leading),
                  SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 0.5,
                      color: scheme.outlineVariant,
                    ),
                  ),
                ] else
                  // Seul élément : il prend toute la largeur.
                  Expanded(child: leading),
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
            ],
          ),
        );
      },
    );
  }
}
