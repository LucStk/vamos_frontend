import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import '/map/injection/map_mode.dart';
import '../../injection/map_editor_mode.dart';
import 'popup_create_vertex.dart';
import 'sketch_pencil_menu.dart';
import '/map/camera/injection/map_camera_provider.dart';

@Dependencies([modeDecorator, MapEditor, mapCamera])
class ContextMenuRoundabout extends ConsumerWidget {
  const ContextMenuRoundabout({super.key, required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = ref.watch(modeDecoratorProvider);
    if (d is! ContextMenuDecorator) return SizedBox.shrink();
    return switch (d) {
      SketchPencilMenu _ => SketchPencilMenuWidget(tripId: tripId),
      IdleMenu _ => PopupCreateVertexWidget(tripId: tripId),
      _ => SizedBox.shrink(),
    };
  }
}
