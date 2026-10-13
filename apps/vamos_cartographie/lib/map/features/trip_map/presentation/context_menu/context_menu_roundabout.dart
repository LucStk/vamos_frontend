import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import '/map/injection/map_mode.dart';
import '../../injection/map_editor_mode.dart';
import 'popup_create_vertex.dart';
import 'sketch_pencil_menu.dart';

@Dependencies([modeOverlay, MapEditor])
class ContextMenuRoundabout extends ConsumerWidget {
  const ContextMenuRoundabout({super.key, required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(mapEditorProvider(tripId).notifier);
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
