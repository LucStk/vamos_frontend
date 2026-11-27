import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_scope.dart';

/// Branche le retour de l'écran carte sur la machine de modes : seul endroit
/// qui lit un provider. Le chrome (sheet, barre) ne voit que [BackScope].
///
/// À placer UNE fois, autour de `MapScreen` (dans `MapShell`).
class MapBackScope extends ConsumerWidget {
  const MapBackScope({super.key, required this.enabled, required this.child});

  /// Faux quand une autre page (profil, login...) est affichée par-dessus la
  /// carte : le retour ne doit alors pas changer de mode en dessous.
  final bool enabled;

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackScope(
      enabled: enabled,
      onBack: () => ref.applyTransition(ref.read(mapModeProvider).back),
      child: child,
    );
  }
}
