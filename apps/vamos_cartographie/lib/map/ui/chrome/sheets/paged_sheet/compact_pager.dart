import 'package:flutter/material.dart';

import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/sheet_page.dart';

/// PageView horizontal des contenus compacts.
///
/// Stateful car il possède son propre contrôleur : quand la sheet se déplie
/// puis revient au repos, le PageView est recréé et repart de la bonne page.
///
/// Le PageView a la hauteur de la page compacte la plus haute (fixée par la
/// sheet) ; chaque page est calée en haut, à sa propre hauteur.
class CompactPager extends StatefulWidget {
  const CompactPager({
    super.key,
    required this.pages,
    required this.page,
    required this.onTap,
  });

  final List<SheetPage> pages;
  final ValueNotifier<int> page;

  /// Tap sur une zone "vide" d'une page : déplie la sheet. Les éléments
  /// interactifs de la page (vignettes, renommage…) gardent la priorité.
  final VoidCallback onTap;

  @override
  State<CompactPager> createState() => _CompactPagerState();
}

class _CompactPagerState extends State<CompactPager> {
  late final PageController _ctrl;
  bool _fromPager = false;

  @override
  void initState() {
    super.initState();
    _ctrl = PageController(initialPage: widget.page.value);
    widget.page.addListener(_syncFromNotifier);
  }

  @override
  void dispose() {
    widget.page.removeListener(_syncFromNotifier);
    _ctrl.dispose();
    super.dispose();
  }

  /// Un tap sur la barre fait défiler le PageView.
  void _syncFromNotifier() {
    if (_fromPager || !_ctrl.hasClients) return;
    final target = widget.page.value;
    if (_ctrl.page?.round() == target) return;
    _ctrl.animateToPage(
      target,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _ctrl,
      onPageChanged: (i) {
        _fromPager = true;
        widget.page.value = i;
        _fromPager = false;
      },
      children: [
        for (final p in widget.pages)
          // Le GestureDetector couvre toute la zone, y compris le vide sous
          // une page plus basse que les autres : un tap n'importe où déplie.
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onTap,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(height: p.compact.height, child: p.compact.child),
            ),
          ),
      ],
    );
  }
}
