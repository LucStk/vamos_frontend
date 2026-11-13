import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/deferred_notifier.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/drag_hint_header.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';

/// Une "page" de la sheet : un contenu compact (au repos) associé à son
/// contenu déplié, plus l'icône qui la représente dans la barre du bas.
class SheetPage {
  const SheetPage({
    required this.label,
    required this.icon,
    this.selectedIcon,
    required this.compact,
    required this.expanded,
  });

  /// Pas affiché dans la barre (icônes seules) : sert au tooltip et à
  /// l'accessibilité.
  final String label;
  final IconData icon;

  /// Variante "pleine" de l'icône pour l'onglet actif (facultatif).
  final IconData? selectedIcon;

  /// Affiché au repos, dans le PageView horizontal.
  final Widget compact;

  /// Affiché quand la sheet est dépliée, pour la page courante.
  final Widget expanded;
}

/// Donne aux pages l'accès au dépliage de la sheet, pour qu'elles placent
/// elles-mêmes leur bouton (voir [SheetExpandButton]).
class SheetScope extends InheritedWidget {
  const SheetScope({
    super.key,
    required this.toggle,
    required this.isAtMin,
    required super.child,
  });

  final VoidCallback toggle;
  final ValueListenable<bool> isAtMin;

  static SheetScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SheetScope>();

  @override
  bool updateShouldNotify(SheetScope old) =>
      toggle != old.toggle || isAtMin != old.isAtMin;
}

/// Petit chevron à placer dans une page : déplie la sheet au repos, la replie
/// une fois dépliée. Invisible hors d'une [DraggableBottomSheetShell].
class SheetExpandButton extends StatelessWidget {
  const SheetExpandButton({super.key});

  @override
  Widget build(BuildContext context) {
    final scope = SheetScope.maybeOf(context);
    if (scope == null) return const SizedBox.shrink();
    final color = Theme.of(context).colorScheme.onSurfaceVariant;

    return ValueListenableBuilder<bool>(
      valueListenable: scope.isAtMin,
      builder: (context, atMin, _) => IconButton(
        visualDensity: VisualDensity.compact,
        tooltip: atMin ? 'Afficher les détails' : 'Réduire',
        onPressed: scope.toggle,
        icon: AnimatedRotation(
          turns: atMin ? 0 : 0.5,
          duration: const Duration(milliseconds: 200),
          child: Icon(Icons.expand_less, size: 20, color: color),
        ),
      ),
    );
  }
}

class DraggableBottomSheetShell extends StatefulWidget {
  final List<SheetPage> pages;

  /// Hauteur fixe de la zone de pages au repos.
  ///
  /// Un PageView a besoin d'une hauteur bornée, on ne peut donc pas laisser
  /// le contenu compact se dimensionner tout seul. Chaque page compacte doit
  /// tenir dans cette hauteur.
  final double compactPageHeight;

  /// Affiché au-dessus du contenu (hauteur nulle au repos).
  final Widget? header;

  final double maxChildSize;

  /// Ajoute à la barre un bouton qui masque la sheet : seule la barre reste
  /// visible, la carte est entièrement dégagée.
  final bool hideable;

  /// Prévenu quand la sheet est masquée / ré-affichée (pour déplacer des
  /// boutons flottants, par exemple).
  final ValueChanged<bool>? onHiddenChanged;

  const DraggableBottomSheetShell({
    super.key,
    required this.pages,
    this.compactPageHeight = 120,
    this.header,
    this.maxChildSize = 0.90,
    this.hideable = true,
    this.onHiddenChanged,
  });

  @override
  State<DraggableBottomSheetShell> createState() =>
      _DraggableBottomSheetShellState();
}

class _DraggableBottomSheetShellState extends State<DraggableBottomSheetShell> {
  final _measureKey = GlobalKey();
  final _isAtMin = DeferredNotifier<bool>(true);

  /// Page courante, partagée entre le PageView, la barre et le contenu déplié.
  final _page = ValueNotifier<int>(0);

  /// Mode "invisible" : la sheet glisse sous la barre.
  final _hidden = ValueNotifier<bool>(false);

  double? _compactHeight;

  /// Contrôleur de la sheet, pour la déplier/replier par un tap.
  ///
  /// La sheet est recréée (ValueKey) quand `minSize` change, et un contrôleur
  /// ne peut être attaché qu'à une seule sheet à la fois : on en crée donc un
  /// nouveau pour chaque `minSize`, et l'ancien est libéré après le frame,
  /// une fois l'ancienne sheet détruite.
  DraggableScrollableController? _sheetCtrl;
  double? _sheetCtrlMinSize;

  /// Vrai pendant l'animation de "rangement" après un drag sous la taille
  /// compacte (masquage ou retour), pour ne pas la relancer en boucle.
  bool _settling = false;

  bool get _hasBar => widget.pages.length > 1 || widget.hideable;

  @override
  void dispose() {
    _isAtMin.dispose();
    _page.dispose();
    _hidden.dispose();
    _sheetCtrl?.dispose();
    super.dispose();
  }

  DraggableScrollableController _controllerFor(double minSize) {
    if (_sheetCtrl == null || _sheetCtrlMinSize != minSize) {
      final old = _sheetCtrl;
      _sheetCtrl = DraggableScrollableController();
      _sheetCtrlMinSize = minSize;
      if (old != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) => old.dispose());
      }
    }
    return _sheetCtrl!;
  }

  void _toggleSheet() {
    final ctrl = _sheetCtrl;
    final minSize = _sheetCtrlMinSize;
    if (ctrl == null || minSize == null || !ctrl.isAttached) return;

    ctrl.animateTo(
      _isAtMin.value ? widget.maxChildSize : minSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  void _setHidden(bool hidden) {
    if (_hidden.value == hidden) return;
    _hidden.value = hidden;
    widget.onHiddenChanged?.call(hidden);

    // Cachée par un glissement, la sheet est à une taille ~0 : on la remonte
    // à sa taille compacte en la ré-affichant.
    if (!hidden) {
      final ctrl = _sheetCtrl;
      final minSize = _sheetCtrlMinSize;
      if (ctrl != null &&
          minSize != null &&
          ctrl.isAttached &&
          ctrl.size < minSize - 0.005) {
        ctrl.animateTo(
          minSize,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
        );
      }
    }
  }

  /// Appelé au relâchement d'un drag. Si la sheet a été tirée sous sa taille
  /// compacte, on décide : assez tirée (ou lancée vers le bas) → masquée,
  /// sinon → retour à la taille compacte.
  void _settleBelowCompact(double minSize, DragEndDetails? details) {
    final ctrl = _sheetCtrl;
    if (ctrl == null || !ctrl.isAttached || _hidden.value) return;
    // La sheet a pu être recréée (nouvelle taille compacte) entre-temps.
    if (minSize != _sheetCtrlMinSize) return;
    // Plusieurs fins de scroll peuvent arriver pour un même geste.
    if (_settling) return;

    final size = ctrl.size;
    if (size >= minSize - 0.005) return;

    final velocity = details?.primaryVelocity ?? 0; // > 0 : vers le bas
    final pulled = 1 - size / minSize; // 0 = compacte, 1 = complètement en bas

    _settling = true;
    final hide = velocity > 400 || pulled > 0.35;

    ctrl
        .animateTo(
          hide ? 0 : minSize,
          duration: const Duration(milliseconds: 200),
          curve: hide ? Curves.easeIn : Curves.easeOutCubic,
        )
        // Si l'animation est interrompue par un nouveau drag, ce Future ne se
        // termine pas : le verrou est alors relâché par le ScrollStart.
        .whenComplete(() {
          _settling = false;
          if (hide && mounted && ctrl.isAttached && ctrl.size < 0.02) {
            _setHidden(true);
          }
        });
  }

  /// Masquée : n'importe quel onglet ré-affiche la sheet sur sa page.
  /// Autre onglet : change de page. Onglet actif : déplie / replie
  /// (raccourci discret, le bouton principal est dans la page).
  void _onTabTap(int index) {
    if (_hidden.value) {
      _page.value = index;
      _setHidden(false);
    } else if (index != _page.value) {
      _page.value = index;
    } else {
      _toggleSheet();
    }
  }

  /// Poignée + espacement + contenu (identique pour la mesure et la vraie sheet).
  ///
  /// Avec une barre, c'est elle qui porte la marge de la barre de gestes.
  /// Sans barre, c'est le contenu qui la porte.
  Widget _withChrome(Widget content) {
    final inner = Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [const DragHintHeader(), const SizedBox(height: 12), content],
      ),
    );
    if (_hasBar) return inner;
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: 8),
      child: inner,
    );
  }

  /// La barre est hors de la sheet, sous elle : elle reste en place quand la
  /// sheet est masquée. Collée à la sheet elle n'a ni ombre ni arrondi ; seule,
  /// elle les prend (Material anime ces deux changements).
  Widget _buildBar() => ValueListenableBuilder<bool>(
    valueListenable: _hidden,
    builder: (context, hidden, child) => Material(
      elevation: hidden ? kSheetElevation : 0,
      borderRadius: hidden ? kSheetRadius : BorderRadius.zero,
      clipBehavior: Clip.antiAlias,
      child: child,
    ),
    child: SafeArea(
      top: false,
      child: _PageBar(
        pages: widget.pages,
        page: _page,
        hidden: _hidden,
        showHide: widget.hideable,
        onSelect: _onTabTap,
        onToggleHidden: () => _setHidden(!_hidden.value),
      ),
    ),
  );

  /// [pager] est remplacé par un widget vide pour la mesure : seule sa
  /// hauteur (fixe) compte.
  Widget _compactBody(Widget pager) =>
      SizedBox(height: widget.compactPageHeight, child: pager);

  Widget _expandedBody() => ValueListenableBuilder<int>(
    valueListenable: _page,
    builder: (context, i, _) {
      final index = i.clamp(0, widget.pages.length - 1);
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: KeyedSubtree(
          key: ValueKey('expanded-$index'),
          child: widget.pages[index].expanded,
        ),
      );
    },
  );

  void _scheduleMeasure() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final box = _measureKey.currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) return;

      final height = box.size.height;
      if (_compactHeight == null || (height - _compactHeight!).abs() > 0.5) {
        setState(() => _compactHeight = height);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _scheduleMeasure();
    final compactHeight = _compactHeight;

    return SheetScope(
      toggle: _toggleSheet,
      isAtMin: _isAtMin,
      child: Stack(
        children: [
          // Mesure invisible : poignée + zone de pages (la barre est à part).
          Offstage(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
                child: RepaintBoundary(
                  key: _measureKey,
                  child: Material(
                    type: MaterialType.transparency,
                    child: _withChrome(_compactBody(const SizedBox.shrink())),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Zone de la sheet : tout l'espace au-dessus de la barre.
                  Expanded(
                    child: compactHeight == null
                        ? const SizedBox.shrink()
                        : LayoutBuilder(
                            builder: (context, constraints) {
                              final minSize =
                                  (compactHeight / constraints.maxHeight).clamp(
                                    0.02,
                                    widget.maxChildSize,
                                  );
                              // ClipRect : la sheet ne doit pas réapparaître
                              // dans les coins arrondis de la barre seule.
                              return ClipRect(
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: _hidden,
                                  builder: (context, hidden, child) =>
                                      IgnorePointer(
                                        ignoring: hidden,
                                        child: AnimatedSlide(
                                          offset: hidden
                                              ? const Offset(0, 1)
                                              : Offset.zero,
                                          duration: const Duration(
                                            milliseconds: 280,
                                          ),
                                          curve: Curves.easeInOutCubic,
                                          child: child,
                                        ),
                                      ),
                                  child: _buildSheet(minSize),
                                ),
                              );
                            },
                          ),
                  ),
                  if (_hasBar) _buildBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSheet(double minSize) {
    return DraggableScrollableSheet(
      key: ValueKey('$minSize/${widget.maxChildSize}'),
      controller: _controllerFor(minSize),
      initialChildSize: minSize,
      // Masquable : la sheet peut descendre sous sa taille compacte, et
      // `_settleBelowCompact` décide au relâchement (masquer ou revenir).
      // La taille compacte reste la référence pour tout le reste.
      minChildSize: widget.hideable ? 0 : minSize,
      maxChildSize: widget.maxChildSize,
      expand: false,
      builder: (context, scrollController) {
        return Material(
          elevation: kSheetElevation,
          borderRadius: kSheetRadius,
          clipBehavior: Clip.antiAlias,
          child: NotificationListener<Notification>(
            onNotification: (n) {
              if (n is DraggableScrollableNotification) {
                // Sous la taille compacte, on garde le contenu compact.
                _isAtMin.set(n.extent <= minSize + 0.01);
              } else if (n is ScrollStartNotification &&
                  n.depth == 0 &&
                  n.dragDetails != null) {
                // Nouveau geste : il interrompt un éventuel rangement en
                // cours, dont le Future ne se terminera alors jamais.
                _settling = false;
              } else if (n is ScrollEndNotification && n.depth == 0) {
                // depth == 0 : la sheet elle-même, pas le PageView ni une
                // liste interne.
                //
                // Surtout pas d'animateTo ici : cette notification peut être
                // envoyée depuis le tick de l'animation d'inertie interne de
                // la sheet, et animateTo dispose ce contrôleur pendant qu'il
                // s'exécute encore (assertion "stop() called after dispose()").
                // On décide donc juste après, une fois la pile terminée.
                final details = n.dragDetails;
                scheduleMicrotask(() {
                  if (mounted) _settleBelowCompact(minSize, details);
                });
              }
              return false;
            },
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: ClampingScrollPhysics(),
                ),
                child: _withChrome(
                  ClipRect(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.header != null) widget.header!,
                        _SwitchedContent(
                          isAtMin: _isAtMin,
                          compact: _compactBody(
                            _CompactPager(
                              pages: widget.pages,
                              page: _page,
                              onTap: _toggleSheet,
                            ),
                          ),
                          expanded: _expandedBody(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SwitchedContent extends StatelessWidget {
  final ValueListenable<bool> isAtMin;
  final Widget compact;
  final Widget expanded;

  const _SwitchedContent({
    required this.isAtMin,
    required this.compact,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isAtMin,
      builder: (context, atMin, _) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: atMin
            ? KeyedSubtree(key: const ValueKey('compact'), child: compact)
            : KeyedSubtree(key: const ValueKey('expanded'), child: expanded),
      ),
    );
  }
}

/// PageView horizontal des contenus compacts.
///
/// Stateful car il possède son propre contrôleur : quand la sheet se déplie
/// puis revient au repos, le PageView est recréé et repart de la bonne page.
class _CompactPager extends StatefulWidget {
  const _CompactPager({
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
  State<_CompactPager> createState() => _CompactPagerState();
}

class _CompactPagerState extends State<_CompactPager> {
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
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onTap,
            child: p.compact,
          ),
      ],
    );
  }
}

/// Barre d'icônes en bas de l'écran, à la manière d'un bottomNavigationBar :
/// une icône par page, puis le bouton qui masque la sheet.
class _PageBar extends StatelessWidget {
  const _PageBar({
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
                    child: _BarTab(
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
                  child: _BarTab(
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

class _BarTab extends StatelessWidget {
  const _BarTab({
    required this.icon,
    this.selectedIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = selected ? scheme.primary : scheme.onSurfaceVariant;
    final shown = selected ? (selectedIcon ?? icon) : icon;

    return Tooltip(
      message: label,
      child: Semantics(
        button: true,
        selected: selected,
        label: label,
        excludeSemantics: true,
        child: InkResponse(
          onTap: onTap,
          radius: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  shown,
                  key: ValueKey(selected),
                  size: 22,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              // Petit trait sous l'onglet actif.
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                width: selected ? 16 : 0,
                height: 3,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
