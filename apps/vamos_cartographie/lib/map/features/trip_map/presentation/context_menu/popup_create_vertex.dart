import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import '/map/overlay_ui/context_menu/context_menu_shell.dart';
import '/map/overlay_ui/context_menu/context_menu_position.dart';
import '../../injection/map_editor_mode.dart';
import '/map/injection/map_mode.dart';
import '/map/camera/injection/map_camera_provider.dart';

@Dependencies([MapEditor, mapCamera, mapDecorator])
class PopupCreateVertexWidget extends ConsumerWidget {
  const PopupCreateVertexWidget({super.key, required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(mapEditorProvider(tripId).notifier);

    return ContextMenuShell(
      child: TextButton.icon(
        onPressed: () => editor.act((m) {
          final latLng = contextMenuLatLngPosition(ref, tripId);
          if (latLng == null) return null;
          return IdleEditorIntents.createVertex(latLng);
        }),
        icon: const Icon(Icons.add, size: 18),
        label: const Text('Créer étape ici'),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
