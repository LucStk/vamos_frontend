import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/context_menu.dart';

@Dependencies([modeOverlay])
class PointMenuShell extends ConsumerWidget {
  const PointMenuShell({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var d = ref.watch(modeOverlayProvider);
    switch (d) {
      case MapPointMenu o:
        return Positioned(
          left: o.at.dx,
          top: o.at.dy,
          child: FractionalTranslation(
            translation: const Offset(-0.5, -1.5),
            child: ContextMenu(child),
          ),
        );
      case _:
        return const SizedBox.shrink();
    }
  }
}
