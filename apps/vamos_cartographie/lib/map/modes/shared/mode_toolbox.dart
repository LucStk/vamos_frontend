import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/mode_entry.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/toolbox.dart';

/// Outil de [ModeToolbox] : actif dans le mode [M], avec son panneau
/// d'actions construit à partir de ce mode.
///
/// `panel` reçoit le mode déjà typé : `(CreateWaypointMode m) => ...` peut
/// appeler `m.validatePosition()` sans cast.
final class ModeTool<M extends AppMode> extends ModeEntry<M> {
  const ModeTool({
    required this.item,
    required super.open,
    required Widget Function(M mode) panel,
  }) : _panel = panel;

  final ToolboxItem item;

  // Privé : lu depuis une `List<ModeTool>` (donc `ModeTool<AppMode>`), un
  // champ `Widget Function(M)` échouerait à l'exécution (paramètre de
  // fonction contravariant). On passe par [panelFor], qui le lit en interne.
  final Widget Function(M mode) _panel;

  /// Panneau pour [mode], qui doit ouvrir cet outil ([isOpenIn]).
  Widget panelFor(AppMode mode) => _panel(mode as M);
}

/// Panneau contextuel : affiché dans le mode [M], sans onglet dans la barre.
///
/// Pour les modes atteints autrement que par un outil (geste sur la carte,
/// commande...) qui ont besoin d'actions : valider, annuler...
final class ModePanel<M extends AppMode> {
  const ModePanel(Widget Function(M mode) panel) : _panel = panel;

  // Privé pour la même raison que `ModeTool._panel`.
  final Widget Function(M mode) _panel;

  bool isOpenIn(AppMode mode) => mode is M;

  Widget panelFor(AppMode mode) => _panel(mode as M);
}

/// Boîte à outils dont les outils sont des modes : le mode courant décide de
/// l'outil actif (et de son panneau), toucher un outil demande son mode.
///
/// [contextual] ajoute des panneaux sans onglet, pour des modes qui ne sont
/// pas des outils. Ils passent avant le panneau d'un outil : un mode plus
/// précis l'emporte.
///
/// Même principe que `ModeTabsSheet` : le mode est l'unique source de vérité,
/// et tous les modes de la famille doivent afficher ce widget à la même
/// place pour que la boîte à outils soit conservée (voir `viewFor`).
class ModeToolbox extends ConsumerWidget {
  const ModeToolbox({
    super.key,
    required this.mode,
    required this.tools,
    required this.closed,
    this.contextual = const [],
    this.leading,
    this.onClose,
  });

  /// Mode courant.
  final AppMode mode;

  final List<ModeTool> tools;

  /// Panneaux sans onglet, chacun actif dans son propre mode.
  final List<ModePanel> contextual;

  /// Mode atteint quand aucun outil n'est actif.
  final AppMode Function() closed;

  final Widget? leading;

  /// Sortie du mode, en croix sur chaque panneau (voir `Toolbox.onClose`).
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = tools.openIndexIn(mode);
    final ctx = contextual.indexWhere((p) => p.isOpenIn(mode));

    // Clés stables (records comparés par valeur) : le panneau ne change en
    // fondu que si l'on passe à un autre panneau, pas à chaque reconstruction.
    final (Widget? panel, Object? panelKey) = ctx != -1
        ? (contextual[ctx].panelFor(mode), ('contextual', ctx))
        : active != null
        ? (tools[active].panelFor(mode), ('tool', active))
        : (null, null);

    return Toolbox(
      items: [for (final t in tools) t.item],
      activeIndex: active,
      panel: panel,
      panelKey: panelKey,
      leading: leading,
      onClose: onClose,
      onSelect: (index) {
        final t = tools.transitionTo(index, mode, closed);
        if (t != null) ref.applyTransition(t);
      },
    );
  }
}
