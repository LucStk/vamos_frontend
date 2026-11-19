import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_scope.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/drag_hint_header.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/compact_pager.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/page_bar.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/paged_sheet_scope.dart';

import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/sheet_page.dart';

class PagedSheet extends StatefulWidget {
  /// Chaque page définit sa hauteur compacte (`SheetPage.compact.height`).
  final List<SheetPage> pages;

  /// Affiché au-dessus du contenu (hauteur nulle au repos).
  final Widget? header;

  final double maxChildSize;

  /// La sheet peut être glissée sous sa taille compacte pour être masquée :
  /// seule la barre reste visible, la carte est entièrement dégagée. Un
  /// onglet de la barre la ré-affiche.
  final bool hideable;

  /// Prévenu quand la sheet est masquée / ré-affichée (pour déplacer des
  /// boutons flottants, par exemple).
  final ValueChanged<bool>? onHiddenChanged;

  /// Placé à gauche de la barre (ex. `BackTab`).
  final Widget? barLeading;

  const PagedSheet({
    super.key,
    required this.pages,
    this.header,
    this.maxChildSize = 0.90,
    this.hideable = true,
    this.onHiddenChanged,
    this.barLeading,
  });

  @override
  State<PagedSheet> createState() => _PagedSheetState();
}

class _PagedSheetState extends State<PagedSheet> {
  final _measureKey = GlobalKey();
  final _isAtMin = DeferredNotifier<bool>(true);

  /// Page courante, partagée entre le PageView, la barre et le contenu déplié.
  final _page = ValueNotifier<int>(0);

  /// Mode "invisible" : la sheet glisse sous la barre.
  final _hidden = ValueNotifier<bool>(false);

  /// Hauteur du chrome de la sheet au repos (poignée, marges, éventuelle
  /// SafeArea), mesurée. La hauteur des pages, elle, est connue d'avance.
  double? _chromeHeight;

  /// Contrôleur de la sheet, pour la déplier/replier par un tap.
  ///
  /// La sheet est recréée (ValueKey) quand `minSize` ou `maxSize` change, et
  /// un contrôleur ne peut être attaché qu'à une seule sheet à la fois : on en
  /// crée donc un nouveau pour chaque couple, et l'ancien est libéré après le
  /// frame, une fois l'ancienne sheet détruite.
  DraggableScrollableController? _sheetCtrl;
  double? _sheetCtrlMinSize;
  double? _sheetCtrlMaxSize;

  /// Vrai pendant l'animation de "rangement" après un drag sous la taille
  /// compacte (masquage ou retour), pour ne pas la relancer en boucle.
  bool _settling = false;

  /// Sans barre (une seule page, pas de retour), la barre serait vide.
  bool get _hasBar => widget.pages.length > 1 || widget.barLeading != null;

  /// Masquer n'a de sens que si une barre reste là pour ré-afficher la sheet.
  bool get _canHide => widget.hideable && _hasBar;

  /// Registre du [BackScope] englobant : tant que la sheet est dépliée, un
  /// retour système la replie au lieu de changer de mode. Null hors scope.
  BackInterceptors? _interceptors;

  @override
  void initState() {
    super.initState();
    _isAtMin.addListener(_syncBack);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final interceptors = BackScope.interceptorsOf(context);
    if (interceptors != _interceptors) {
      _interceptors?.set(this, null);
      _interceptors = interceptors;
      _syncBack();
    }
  }

  @override
  void dispose() {
    _isAtMin.removeListener(_syncBack);
    _interceptors?.set(this, null);
    _isAtMin.dispose();
    _page.dispose();
    _hidden.dispose();
    _sheetCtrl?.dispose();
    super.dispose();
  }

  /// Dépliée : un retour replie la sheet. Repliée : on laisse passer.
  ///
  /// `_toggleSheet` est une méthode : sa tear-off est égale d'un appel à
  /// l'autre, donc `set` ne notifie pas inutilement.
  void _syncBack() =>
      _interceptors?.set(this, _isAtMin.value ? null : _toggleSheet);

  DraggableScrollableController _controllerFor(double minSize, double maxSize) {
    if (_sheetCtrl == null ||
        _sheetCtrlMinSize != minSize ||
        _sheetCtrlMaxSize != maxSize) {
      final old = _sheetCtrl;
      _sheetCtrl = DraggableScrollableController();
      _sheetCtrlMinSize = minSize;
      _sheetCtrlMaxSize = maxSize;
      if (old != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) => old.dispose());
      }
    }
    return _sheetCtrl!;
  }

  int get _currentIndex => _page.value.clamp(0, widget.pages.length - 1);

  /// La page [index] a-t-elle un contenu déplié ?
  bool _canExpand(int index) =>
      widget.pages.isNotEmpty &&
      widget.pages[index.clamp(0, widget.pages.length - 1)].expanded != null;

  /// Déplie / replie. Sans contenu déplié, ne fait rien (la sheet ne peut de
  /// toute façon pas monter au-dessus de sa taille compacte).
  void _toggleSheet() {
    final ctrl = _sheetCtrl;
    final minSize = _sheetCtrlMinSize;
    final maxSize = _sheetCtrlMaxSize;
    if (ctrl == null || minSize == null || maxSize == null) return;
    if (!ctrl.isAttached || maxSize <= minSize + 0.001) return;

    ctrl.animateTo(
      _isAtMin.value ? maxSize : minSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  /// Ferme la sheet : elle descend sous la barre, puis [_setHidden] prévient
  /// la page (`onClose`). Même fin qu'un glissement vers le bas.
  void _closeSheet() {
    final ctrl = _sheetCtrl;
    if (ctrl == null || !ctrl.isAttached || _hidden.value || _settling) return;

    _settling = true;
    ctrl
        .animateTo(
          0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeIn,
        )
        .whenComplete(() {
          _settling = false;
          if (mounted) _setHidden(true);
        });
  }

  void _setHidden(bool hidden) {
    if (_hidden.value == hidden) return;
    _hidden.value = hidden;
    widget.onHiddenChanged?.call(hidden);

    // Fermée (bouton ou glissement) : la page peut abandonner sa tâche.
    if (hidden && widget.pages.isNotEmpty) {
      widget.pages[_currentIndex].onClose?.call();
    }

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
  /// Autre onglet : change de page.
  /// Onglet actif : cycle compact → déplié → fermé. Une page sans contenu
  /// déplié passe directement de compact à fermé. Sheet non masquable : on
  /// se contente de déplier / replier.
  void _onTabTap(int index) {
    if (_hidden.value) {
      _page.value = index;
      _setHidden(false);
    } else if (index != _page.value) {
      _page.value = index;
    } else if (_isAtMin.value && _canExpand(index)) {
      _toggleSheet();
    } else if (_canHide) {
      _closeSheet();
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
      child: PageBar(
        pages: widget.pages,
        page: _page,
        hidden: _hidden,
        onSelect: _onTabTap,
        leading: widget.barLeading,
      ),
    ),
  );

  /// Hauteur de la zone compacte : celle de la page compacte la plus haute.
  ///
  /// Une seule hauteur pour toutes les pages : le pager doit garder une
  /// hauteur fixe pendant qu'on glisse d'une page à l'autre, et une taille
  /// compacte qui changerait avec la page recréerait la sheet (et le pager)
  /// au milieu du geste. Les pages plus basses sont calées en haut.
  double get _compactZoneHeight => widget.pages.isEmpty
      ? SheetCompact.defaultHeight
      : widget.pages.map((p) => p.compact.height).reduce(max);

  Widget _compactBody(Widget pager) =>
      SizedBox(height: _compactZoneHeight, child: pager);

  Widget _expandedBody() => ValueListenableBuilder<int>(
    valueListenable: _page,
    builder: (context, i, _) {
      final index = i.clamp(0, widget.pages.length - 1);
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: KeyedSubtree(
          key: ValueKey('expanded-$index'),
          // Jamais affiché sans contenu déplié : la sheet ne monte pas.
          child: widget.pages[index].expanded ?? const SizedBox.shrink(),
        ),
      );
    },
  );

  /// Mesure le chrome (poignée, marges, SafeArea). Il ne change que si la
  /// barre apparaît ou disparaît : la hauteur des pages s'ajoute par calcul,
  /// sans attendre une frame de mesure.
  void _scheduleMeasure() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final box = _measureKey.currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) return;

      final height = box.size.height;
      if (_chromeHeight == null || (height - _chromeHeight!).abs() > 0.5) {
        setState(() => _chromeHeight = height);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _scheduleMeasure();
    final chromeHeight = _chromeHeight;
    final compactHeight = chromeHeight == null
        ? null
        : chromeHeight + _compactZoneHeight;

    return PagedSheetScope(
      toggle: _toggleSheet,
      isAtMin: _isAtMin,
      child: Stack(
        children: [
          // Mesure invisible : le chrome seul, zone de pages vide.
          Offstage(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
                child: RepaintBoundary(
                  key: _measureKey,
                  child: Material(
                    type: MaterialType.transparency,
                    child: _withChrome(const SizedBox.shrink()),
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
                                  // Hauteur max selon la page : une page sans
                                  // contenu déplié ne monte pas.
                                  child: ValueListenableBuilder<int>(
                                    valueListenable: _page,
                                    builder: (context, index, _) => _buildSheet(
                                      minSize,
                                      _canExpand(index)
                                          ? widget.maxChildSize
                                          : minSize,
                                    ),
                                  ),
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

  /// Changer de [maxSize] (page avec / sans contenu déplié) recrée la sheet,
  /// qui repart à sa taille compacte.
  Widget _buildSheet(double minSize, double maxSize) {
    return DraggableScrollableSheet(
      key: ValueKey('$minSize/$maxSize'),
      controller: _controllerFor(minSize, maxSize),
      initialChildSize: minSize,
      // Masquable : la sheet peut descendre sous sa taille compacte, et
      // `_settleBelowCompact` décide au relâchement (masquer ou revenir).
      // La taille compacte reste la référence pour tout le reste.
      minChildSize: _canHide ? 0 : minSize,
      maxChildSize: maxSize,
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
                            CompactPager(
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
