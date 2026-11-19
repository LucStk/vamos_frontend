import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/sheet_page.dart';

/// Un onglet lié à un mode : l'onglet est ouvert quand le mode courant est
/// un [M], et le toucher fait passer en mode [open].
///
/// [M] se déduit de [open] :
/// `ModeTab(page: ..., open: () => CreateWaypointMode(tripId))` est un
/// `ModeTab<CreateWaypointMode>`.
final class ModeTab<M extends AppMode> {
  const ModeTab({required this.page, required this.open});

  final SheetPage page;

  /// Mode à atteindre en touchant l'onglet.
  final M Function() open;

  /// Le mode [mode] ouvre-t-il cet onglet ?
  bool isOpenIn(AppMode mode) => mode is M;
}
