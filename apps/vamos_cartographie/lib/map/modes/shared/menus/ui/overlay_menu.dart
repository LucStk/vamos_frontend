// map/ui/shared/menus/overlay_menu.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/object_menu_shell.dart';
import 'package:vamos_cartographie/map/ui/shared/camera/world_positioned.dart';

/// Reçoit l'objet du menu ET l'endroit du tap, déjà typés : `HitObject<T>`.
typedef OverlayMenuBuilder<T extends MapObject> =
    Widget Function(BuildContext context, HitObject<T> hit);

/// Affiche un menu ancré dans le monde, seulement si l'overlay ouvert est un
/// menu ouvert sur un [T].
@Dependencies([modeOverlay])
class OverlayMenu<T extends MapObject> extends ConsumerWidget {
  const OverlayMenu({super.key, required this.builder, this.topOffset = 50});

  final OverlayMenuBuilder<T> builder;
  final double topOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlay = ref.watch(modeOverlayProvider);
    final menu = overlay is EventMenu ? overlay : null;
    final hit = menu?.hitAs<T>();
    if (menu == null || hit == null) return kEmptyPositioned;

    return ObjectMenuShell(
      worldOffset: menu.position,
      topOffset: topOffset,
      child: builder(context, hit),
    );
  }
}

@Dependencies([modeOverlay])
class GeoMenu extends ConsumerWidget {
  const GeoMenu({super.key, required this.builder});
  final Widget Function(BuildContext, HitGeo) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlay = ref.watch(modeOverlayProvider);
    if (overlay is! EventMenu<MapHit>) return kEmptyPositioned;
    final hit = overlay.hit;
    if (hit is! HitGeo) return kEmptyPositioned;

    return ObjectMenuShell(
      worldOffset: hit.point,
      child: builder(context, hit),
    );
  }
}
