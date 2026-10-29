// map/ui/shared/menus/overlay_menu.dart
import 'package:domain_core/space/offset_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/providers/menu_placement.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/object_menu_shell.dart';
import 'package:vamos_cartographie/map/ui/shared/camera/world_positioned.dart';

typedef OverlayMenuBuilder<T> =
    Widget Function(BuildContext context, T overlay);

/// Affiche un menu ancré dans le monde, seulement si l'overlay ouvert est un [T].
@Dependencies([])
class OverlayMenu<T extends ContextMenuOverlay<AppMode>>
    extends ConsumerWidget {
  const OverlayMenu({super.key, required this.builder, this.topOffset = 50});

  final OverlayMenuBuilder<T> builder;
  final double topOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlay = ref.watch(modeOverlayProvider);
    if (overlay is! T) return kEmptyPositioned;

    return ObjectMenuShell(
      worldOffset: overlay.position,
      topOffset: topOffset,
      child: builder(context, overlay),
    );
  }
}
