import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';
import 'package:vamos_cartographie/ui_kit/inputs/pinned_actions.dart';

/// Part de la hauteur disponible prise par un dialog qui laisse voir la carte
/// (jour, morceau, waypoint) ; la fiche du voyage prend tout.
const kPartialDialogHeightFactor = 0.55;

/// Clé commune des dialogs qui laissent la carte visible (jour, morceau,
/// waypoint) : passer de l'un à l'autre garde le même [InfoDialog] (même
/// cadre, pas de réapparition), seuls son contenu et ses onglets changent.
/// Un seul de ces dialogs existe à la fois.
final kSelectionDialogKey = GlobalKey(debugLabel: 'selection_dialog');

/// Un onglet d'un [InfoDialog].
class InfoDialogPage {
  const InfoDialogPage({
    required this.label,
    required this.icon,
    required this.child,
    this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final Widget child;
}

/// Fiche en dialog, posée juste au-dessus du dock : un en-tête (titre), des
/// onglets, un contenu qui défile.
///
/// Elle ne se glisse pas : sa taille est fixe, quel que soit l'onglet. Les
/// boutons valider / annuler d'un champ multiligne en édition y sont épinglés
/// sous le contenu (voir [PinnedActionsHost]), donc toujours visibles.
///
/// Partagée par la fiche du voyage (tout l'écran) et celle d'une journée
/// (une partie, pour garder la carte visible).
class InfoDialog extends StatefulWidget {
  const InfoDialog({
    super.key,
    required this.header,
    required this.pages,
    required this.bottomInset,
    this.heightFactor = 1,
    this.contentKey,
    this.footer,
  }) : assert(pages.length > 0);

  /// Le titre, en haut (typiquement un champ modifiable en place).
  final Widget header;

  /// Un seul onglet : la barre d'onglets est alors masquée.
  final List<InfoDialogPage> pages;

  /// Place laissée libre sous le dialog, pour le dock.
  final double bottomInset;

  /// Part (0..1] de la hauteur disponible occupée par le dialog.
  final double heightFactor;

  /// Identité de ce que montre le dialog (un autre jour, un autre morceau) :
  /// quand elle change, on revient au premier onglet.
  final Object? contentKey;

  /// Fixé en bas du dialog, sous le contenu qui défile : visible quel que
  /// soit l'onglet.
  final Widget? footer;

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  int _tab = 0;
  final _pinned = PinnedActionsHost();

  @override
  void didUpdateWidget(InfoDialog old) {
    super.didUpdateWidget(old);
    if (old.contentKey != widget.contentKey) _tab = 0;
  }

  @override
  void dispose() {
    _pinned.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = widget.pages;
    final tab = _tab.clamp(0, pages.length - 1);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 12, widget.bottomInset),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
            child: LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                width: double.infinity,
                // Une taille fixe, déduite de la place disponible : le dialog
                // ne bouge pas quand on change d'onglet.
                height: constraints.maxHeight * widget.heightFactor,
                // Surgit du bouton, en bas au milieu.
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOutCubic,
                  builder: (context, t, child) => Opacity(
                    opacity: t,
                    child: Transform.scale(
                      scale: 0.92 + 0.08 * t,
                      alignment: Alignment.bottomCenter,
                      child: child,
                    ),
                  ),
                  child: Material(
                    elevation: kSheetElevation,
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                          child: widget.header,
                        ),
                        if (pages.length > 1)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                            child: SegmentedButton<int>(
                              showSelectedIcon: false,
                              segments: [
                                for (final (i, page) in pages.indexed)
                                  ButtonSegment(
                                    value: i,
                                    icon: Icon(
                                      i == tab
                                          ? page.selectedIcon ?? page.icon
                                          : page.icon,
                                    ),
                                    label: Text(page.label),
                                  ),
                              ],
                              selected: {tab},
                              onSelectionChanged: (s) =>
                                  setState(() => _tab = s.first),
                            ),
                          ),
                        // Le contenu défile ; la barre des boutons d'édition
                        // vient juste dessous (collée au texte s'il tient, au
                        // bas du dialog s'il défile).
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: PinnedActionsScope(
                              host: _pinned,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Flexible(
                                    child: SingleChildScrollView(
                                      padding: const EdgeInsets.all(16),
                                      child: AnimatedSwitcher(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        layoutBuilder: (current, previous) =>
                                            Stack(
                                              alignment: Alignment.topCenter,
                                              children: [...previous, ?current],
                                            ),
                                        child: KeyedSubtree(
                                          key: ValueKey((widget.contentKey, tab)),
                                          child: pages[tab].child,
                                        ),
                                      ),
                                    ),
                                  ),
                                  PinnedActionsBar(host: _pinned),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (widget.footer != null)
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: widget.footer,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
