import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/mode_entry.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/paged_sheet.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/sheet_page.dart';

/// Onglet de [ModeTabsSheet] : une page de sheet, ouverte dans le mode [M].
final class ModeTab<M extends AppMode> extends ModeEntry<M> {
  const ModeTab({required this.page, required super.open});

  final SheetPage page;
}

/// [PagedSheet] dont les onglets sont des modes : le mode courant décide de
/// l'onglet ouvert, et toucher un onglet demande le mode correspondant.
///
/// Le mode reste l'unique source de vérité : si un autre chemin change de
/// mode (commande serveur, geste sur la carte, retour), la sheet suit.
///
/// Pour garder la même sheet (et ses animations) entre les modes d'une même
/// famille, tous doivent afficher ce widget à la même place (voir `viewFor`).
class ModeTabsSheet extends ConsumerWidget {
  const ModeTabsSheet({
    super.key,
    required this.mode,
    required this.tabs,
    required this.closed,
    this.barLeading,
    this.header,
  });

  /// Mode courant.
  final AppMode mode;

  final List<ModeTab> tabs;

  /// Mode atteint quand aucun onglet n'est ouvert (sheet fermée).
  final AppMode Function() closed;

  final Widget? barLeading;
  final Widget? header;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PagedSheet(
      pages: [for (final t in tabs) t.page],
      barLeading: barLeading,
      header: header,
      activePage: tabs.openIndexIn(mode),
      onActivePageChanged: (page) {
        final t = tabs.transitionTo(page, mode, closed);
        if (t != null) ref.applyTransition(t);
      },
    );
  }
}
