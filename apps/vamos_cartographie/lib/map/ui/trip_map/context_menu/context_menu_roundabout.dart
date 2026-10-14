import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';

@Dependencies([modeOverlay, modeMachine])
class ContextMenuRoundabout extends ConsumerWidget {
  const ContextMenuRoundabout({super.key, required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(modeMachineProvider);
    final d = ref.watch(modeOverlayProvider);
    if (d is! ContextMenuOverlay) return SizedBox.shrink();
    return switch (d) {
      PencilMenu _ => SketchPencilMenuWidget(
        onPressed: () => editor.apply(d.valideCreation()),
      ),
      IdleMenu _ => PopupCreateVertexWidget(
        onPressed: () => editor.apply(d.createVertex()),
      ),
      _ => SizedBox.shrink(),
    };
  }
}
