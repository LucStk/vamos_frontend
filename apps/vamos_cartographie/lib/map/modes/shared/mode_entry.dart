import 'package:map_engine/map_engine.dart';

/// Une entrée (onglet, outil...) liée à un mode : elle est « ouverte » quand
/// le mode courant est un [M], et la choisir fait passer en mode [open].
///
/// [M] se déduit de [open] : `open: () => CreateWaypointMode(tripId)` donne
/// une entrée `<CreateWaypointMode>`.
abstract class ModeEntry<M extends AppMode> {
  const ModeEntry({required this.open});

  /// Mode à atteindre en choisissant l'entrée.
  final M Function() open;

  /// Le mode [mode] ouvre-t-il cette entrée ?
  bool isOpenIn(AppMode mode) => mode is M;
}

/// Logique commune à toutes les listes d'entrées pilotées par le mode.
extension ModeEntries<E extends ModeEntry> on List<E> {
  /// Index de l'entrée ouverte par [mode], ou null si aucune.
  int? openIndexIn(AppMode mode) {
    final i = indexWhere((e) => e.isOpenIn(mode));
    return i == -1 ? null : i;
  }

  /// Transition pour ouvrir l'entrée [index] (null : aucune, mode [closed]),
  /// ou null si [mode] est déjà dans cet état.
  Transition? transitionTo(
    int? index,
    AppMode mode,
    AppMode Function() closed,
  ) {
    final alreadyThere = index == null
        ? openIndexIn(mode) == null
        : this[index].isOpenIn(mode);
    if (alreadyThere) return null;
    return Transition.to(index == null ? closed() : this[index].open());
  }
}
