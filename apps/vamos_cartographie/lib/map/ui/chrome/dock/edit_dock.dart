import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';

/// Le seul contrôle de l'édition du trip, en bas à droite.
///
/// - Sans panneau : une simple flèche retour, dans un conteneur à sa taille.
/// - Avec un panneau : le conteneur s'étend depuis la flèche, qui devient une
///   croix. La croix referme le panneau (jamais l'édition) ; il faut alors
///   un second retour pour quitter l'édition.
///
/// Ne connaît ni les modes ni Riverpod : le parent donne le [panel] (ou null)
/// et ce que fait [onPressed]. [panelKey] identifie le panneau : le changer
/// l'échange en fondu, le garder le met seulement à jour.
class EditDock extends StatefulWidget {
  const EditDock({
    super.key,
    required this.onPressed,
    this.panel,
    this.panelKey,
  });

  final VoidCallback onPressed;
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

  late final AnimationController _open = AnimationController(
    vsync: this,
    duration: _duration,
    value: widget.panel == null ? 0 : 1,
  );

  /// Dernier panneau affiché : il reste le temps de la fermeture.
  Widget? _shown;
  Object? _shownKey;

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
      _shown = widget.panel;
      _shownKey = widget.panelKey;
      _open.forward();
    } else {
      _open.reverse();
    }
  }

  @override
  void dispose() {
    _open.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isOpen = widget.panel != null;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(_margin),
        child: Align(
          alignment: Alignment.bottomRight,
          child: LayoutBuilder(
            builder: (context, box) {
              final width = box.maxWidth < kSheetMaxWidth
                  ? box.maxWidth
                  : kSheetMaxWidth;
              final curve = CurvedAnimation(
                parent: _open,
                curve: Curves.easeOutCubic,
              );

              return Material(
                elevation: kSheetElevation,
                color: scheme.surface,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Le panneau se dévoile depuis le coin du bouton.
                    AnimatedBuilder(
                      animation: curve,
                      builder: (context, child) => ClipRect(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          widthFactor: curve.value,
                          heightFactor: curve.value,
                          child: child,
                        ),
                      ),
                      child: SizedBox(
                        width: width,
                        child: _shown == null
                            ? null
                            : Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  12,
                                  12,
                                  12,
                                  0,
                                ),
                                child: AnimatedSize(
                                  duration: _duration,
                                  curve: Curves.easeOutCubic,
                                  alignment: Alignment.bottomCenter,
                                  child: AnimatedSwitcher(
                                    duration: _duration,
                                    child: KeyedSubtree(
                                      key: ValueKey(_shownKey),
                                      child: _shown!,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: _buttonSize,
                      child: IconButton(
                        tooltip: isOpen ? 'Fermer' : 'Retour',
                        onPressed: widget.onPressed,
                        // La flèche se change en croix en tournant.
                        icon: AnimatedSwitcher(
                          duration: _duration,
                          transitionBuilder: (child, animation) =>
                              RotationTransition(
                                turns: Tween(
                                  begin: 0.75,
                                  end: 1.0,
                                ).animate(animation),
                                child: FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                              ),
                          child: Icon(
                            isOpen ? Icons.close : Icons.adaptive.arrow_back,
                            key: ValueKey(isOpen),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
