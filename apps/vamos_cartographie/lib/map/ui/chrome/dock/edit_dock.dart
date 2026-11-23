import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';

/// Le seul contrôle de l'édition du trip, en bas à gauche.
///
/// - Sans panneau : un bouton retour dans son propre conteneur, rien d'autre.
/// - Avec un panneau : il est « tiré » de gauche à droite et prend la place
///   du bouton retour, qui disparaît : on ferme le panneau (croix) avant de
///   pouvoir revenir en arrière.
///   Sa croix, en haut à droite, a son propre conteneur en relief, un peu
///   au-dessus du panneau : ce n'est pas une action du panneau, qui garde
///   donc toute sa largeur pour ses réglages et ses actions.
///
/// Ne connaît ni les modes ni Riverpod : le parent donne le [panel] (ou null)
/// et les deux actions. [panelKey] identifie le panneau : le changer l'échange
/// en fondu, le garder le met seulement à jour.
class EditDock extends StatefulWidget {
  const EditDock({
    super.key,
    required this.onBack,
    required this.onClose,
    this.panel,
    this.panelKey,
  });

  /// Le bouton retour.
  final VoidCallback onBack;

  /// La croix du panneau.
  final VoidCallback onClose;

  final Widget? panel;
  final Object? panelKey;

  @override
  State<EditDock> createState() => _EditDockState();
}

class _EditDockState extends State<EditDock>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 240);
  static const _buttonSize = 48.0;
  static const _margin = 12.0;
  static const _radius = 20.0;

  /// La croix dépasse du panneau : place réservée au-dessus de lui.
  static const _crossSize = 36.0;
  static const _crossOverlap = 8.0; // part de la croix qui mord sur le panneau
  static const _headroom = _crossSize - _crossOverlap;

  late final AnimationController _open = AnimationController(
    vsync: this,
    duration: _duration,
    value: widget.panel == null ? 0 : 1,
  );

  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _open,
    curve: Curves.easeOutCubic,
  );

  /// Dernier panneau affiché : il reste le temps de la fermeture.
  Widget? _shown;
  Object? _shownKey;

  /// Clé du fondu entre deux panneaux : un compteur, jamais réutilisé. Avec la
  /// clé du panneau elle-même, repasser à un panneau encore en train de
  /// disparaître donnerait deux enfants de même clé.
  int _generation = 0;

  @override
  void initState() {
    super.initState();
    _shown = widget.panel;
    _shownKey = widget.panelKey;
  }

  @override
  void didUpdateWidget(EditDock old) {
    super.didUpdateWidget(old);
    if (widget.panel != null) {
      // Le panneau est remplacé par un autre (et non simplement mis à jour).
      if (_shown != null && widget.panelKey != _shownKey) _generation++;
      _shown = widget.panel;
      _shownKey = widget.panelKey;
      _open.forward();
    } else {
      _open.reverse();
    }
  }

  @override
  void dispose() {
    _curve.dispose();
    _open.dispose();
    super.dispose();
  }

  Widget _surface({required Widget child}) => Material(
    elevation: kSheetElevation,
    color: Theme.of(context).colorScheme.surface,
    borderRadius: BorderRadius.circular(_radius),
    clipBehavior: Clip.antiAlias,
    child: child,
  );

  /// Le retour s'efface quand le panneau prend sa place. Au repos, aucun
  /// découpage : son ombre reste entière.
  Widget _backButton(double t) {
    final button = _surface(
      child: SizedBox.square(
        dimension: _buttonSize,
        child: IconButton(
          tooltip: 'Retour',
          onPressed: widget.onBack,
          icon: Icon(Icons.adaptive.arrow_back),
        ),
      ),
    );
    if (t == 0) return button;

    return ClipRect(
      clipper: const _RevealClipper(),
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: 1 - t,
        heightFactor: 1,
        child: IgnorePointer(
          child: Opacity(opacity: 1 - t, child: button),
        ),
      ),
    );
  }

  Widget _cross(double t) => Opacity(
    opacity: t,
    child: Transform.scale(
      scale: 0.6 + 0.4 * t,
      child: Material(
        elevation: 6,
        shape: const CircleBorder(),
        color: Theme.of(context).colorScheme.surface,
        child: SizedBox.square(
          dimension: _crossSize,
          child: IconButton(
            tooltip: 'Fermer',
            iconSize: 20,
            padding: EdgeInsets.zero,
            onPressed: widget.onClose,
            icon: const Icon(Icons.close),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final curve = _curve;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(_margin),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: LayoutBuilder(
            builder: (context, box) {
              final total = box.maxWidth < kSheetMaxWidth
                  ? box.maxWidth
                  : kSheetMaxWidth;
              return AnimatedBuilder(
                animation: curve,
                builder: (context, panel) {
                  final t = curve.value;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Le retour s'efface quand le panneau prend sa place :
                      // fermer le panneau d'abord, quitter l'édition ensuite.
                      if (t < 1) _backButton(t),
                      // Le panneau est tiré vers la droite. Fermé, il n'existe
                      // plus du tout (ni ombre ni liseré).
                      if (t > 0)
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: _headroom),
                              // Ouvert en grand : plus rien à découper, l'ombre
                              // du bord droit reste entière.
                              child: t >= 1
                                  ? panel
                                  : ClipRect(
                                      clipper: const _RevealClipper(),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        widthFactor: t,
                                        // Sans quoi il prendrait toute la hauteur.
                                        heightFactor: 1,
                                        child: panel,
                                      ),
                                    ),
                            ),
                            Positioned(top: 0, right: 12, child: _cross(t)),
                          ],
                        ),
                    ],
                  );
                },
                child: SizedBox(
                  width: total,
                  child: _shown == null
                      ? null
                      : _surface(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: AnimatedSize(
                              duration: _duration,
                              curve: Curves.easeOutCubic,
                              alignment: Alignment.bottomCenter,
                              child: AnimatedSwitcher(
                                duration: _duration,
                                child: KeyedSubtree(
                                  key: ValueKey(_generation),
                                  child: _shown!,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Ne coupe que le bord droit du panneau en cours de dévoilement : l'ombre
/// des autres côtés reste visible.
class _RevealClipper extends CustomClipper<Rect> {
  const _RevealClipper();

  static const _shadow = 24.0;

  @override
  Rect getClip(Size size) =>
      Rect.fromLTRB(-_shadow, -_shadow, size.width, size.height + _shadow);

  @override
  bool shouldReclip(_RevealClipper oldClipper) => false;
}
