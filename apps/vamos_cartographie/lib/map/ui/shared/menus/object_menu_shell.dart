import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/camera_or_null.dart';
import 'package:vamos_cartographie/map/mode/menu_placement.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/context_menu.dart';

/// Affiche [child] au-dessus de l'ancre du menu ouvert.
///
/// - Riverpod fournit la position MONDE de l'ancre (`menuPlacement`, une
///   famille par caméra) : elle ne change que si le menu ou l'objet ancré
///   change.
/// - La conversion monde → écran est refaite à chaque événement de la carte
///   (`camera.changes`), sans reconstruire le contenu du menu.
@Dependencies([menuPlacement, cameraOrNull])
class ObjectMenuShell extends ConsumerWidget {
  const ObjectMenuShell({super.key, required this.child});

  final Widget child;

  /// Espace entre le bas du menu et le centre de l'ancre
  /// (rayon visuel du vertex + marge).
  static const _gap = 13.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // null tant que la carte n'est pas montée (camera.ready == false).
    final camera = ref.watch(cameraOrNullProvider);
    if (camera == null) return const SizedBox.shrink();

    final world = ref.watch(
      menuPlacementProvider(camera).select((p) => p?.world),
    );
    if (world == null) return const SizedBox.shrink();

    return ListenableBuilder(
      listenable: camera.changes,
      // Construit une seule fois : seul le positionnement suit la caméra.
      child: ContextMenu(child),
      builder: (context, menu) {
        final at = camera.worldToScreen(world);
        return Positioned(
          left: at.dx,
          top: at.dy - _gap,
          child: FractionalTranslation(
            translation: const Offset(-0.5, -1),
            child: menu,
          ),
        );
      },
    );
  }
}
