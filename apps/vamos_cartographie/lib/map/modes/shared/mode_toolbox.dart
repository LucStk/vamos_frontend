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

/// Boîte à outils dont les outils sont des modes : le mode courant décide de
/// l'outil actif (et de son panneau), toucher un outil demande son mode.
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
    this.leading,
  });

  /// Mode courant.
  final AppMode mode;

  final List<ModeTool> tools;

  /// Mode atteint quand aucun outil n'est actif.
  final AppMode Function() closed;

  final Widget? leading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = tools.openIndexIn(mode);

    return Toolbox(
      items: [for (final t in tools) t.item],
      activeIndex: active,
      panel: active == null ? null : tools[active].panelFor(mode),
      leading: leading,
      onSelect: (index) {
        final t = tools.transitionTo(index, mode, closed);
        if (t != null) ref.applyTransition(t);
      },
    );
  }
}
