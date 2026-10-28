import 'package:domain_core/space/offset_type.dart';
import 'package:flutter/material.dart';
// import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/ui/shared/camera/world_positioned.dart';

/// Affiche [child] au-dessus de l'ancre du menu ouvert.
///
/// - Riverpod fournit la position MONDE de l'ancre (`menuPlacement`, une
///   famille par caméra) : elle ne change que si le menu ou l'objet ancré
///   change.
/// - La conversion monde → écran est refaite à chaque événement de la carte
///   (`camera.changes`), sans reconstruire le contenu du menu.
// @Dependencies([cameraOrNull])
class ObjectMenuShell extends StatelessWidget {
  const ObjectMenuShell({
    super.key,
    required this.worldOffset,
    required this.child,
    this.topOffset = 50,
  });

  final Widget child;
  final WorldOffset worldOffset;
  final double topOffset;

  @override
  Widget build(BuildContext context) {
    return WorldPositioned(
      offset: Offset(0, -topOffset),
      worldOffset: worldOffset,
      alignment: Alignment.bottomCenter,
      child: child,
    );
  }
}
