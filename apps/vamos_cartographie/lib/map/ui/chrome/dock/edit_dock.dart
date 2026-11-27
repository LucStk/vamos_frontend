import 'package:material_ui/material_ui.dart';
import 'package:vamos_cartographie/map/ui/chrome/dock/dock_button.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';

/// Le dock d'un outil, en bas de l'écran, comme celui de la lecture du trip.
///
/// - Sans panneau : un bouton retour en bas à gauche, rien d'autre.
/// - Avec un panneau : il se déploie au-dessus du dock, et le retour laisse la
///   place à une croix en bas au centre, qui le ferme. On ferme le panneau
///   avant de pouvoir revenir en arrière.
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
  static const _margin = 12.0;
  static const _radius = 20.0;

  /// Espace entre le panneau et les boutons.
  static const _gap = 12.0;

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

  Widget _panel() => _surface(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: AnimatedSize(
        duration: _duration,
        curve: Curves.easeOutCubic,
        alignment: Alignment.bottomCenter,
        child: AnimatedSwitcher(
          duration: _duration,
          child: KeyedSubtree(key: ValueKey(_generation), child: _shown!),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(_margin),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
            child: AnimatedBuilder(
              animation: _curve,
              builder: (context, _) {
                final t = _curve.value;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Le panneau se déploie vers le haut. Fermé, il n'existe
                    // plus du tout (ni ombre ni liseré).
                    if (t > 0 && _shown != null)
                      Padding(
                        padding: EdgeInsets.only(bottom: _gap * t),
                        // Ouvert en grand : plus rien à découper, l'ombre du
                        // bord haut reste entière.
                        child: t >= 1
                            ? _panel()
                            : ClipRect(
                                clipper: const _RevealClipper(),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  heightFactor: t,
                                  child: Opacity(opacity: t, child: _panel()),
                                ),
                              ),
                      ),
                    SizedBox(
                      height: DockButton.size,
                      child: Stack(
                        children: [
                          // Le retour s'efface quand le panneau s'ouvre.
                          if (t < 1)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IgnorePointer(
                                ignoring: t > 0,
                                child: Opacity(
                                  opacity: 1 - t,
                                  child: DockButton(
                                    icon: Icons.adaptive.arrow_back,
                                    tooltip: 'Retour',
                                    onPressed: widget.onBack,
                                  ),
                                ),
                              ),
                            ),
                          // La croix du panneau, au centre comme celle des
                          // fiches de la lecture du trip.
                          if (t > 0)
                            Align(
                              child: Opacity(
                                opacity: t,
                                child: Transform.scale(
                                  scale: 0.6 + 0.4 * t,
                                  child: DockButton(
                                    icon: Icons.close,
                                    tooltip: 'Fermer',
                                    onPressed: widget.onClose,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Ne coupe que le bord haut du panneau en cours de dévoilement : l'ombre des
/// autres côtés reste visible.
class _RevealClipper extends CustomClipper<Rect> {
  const _RevealClipper();

  static const _shadow = 24.0;

  @override
  Rect getClip(Size size) =>
      Rect.fromLTRB(-_shadow, 0, size.width + _shadow, size.height + _shadow);

  @override
  bool shouldReclip(_RevealClipper oldClipper) => false;
}
