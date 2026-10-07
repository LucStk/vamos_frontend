import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import '../../../camera/injection/map_camera_provider.dart';
import '../../../injection/popup_provider.dart';
import '../../../overlay_ui/popup_overlay.dart';
import '../injection/map_editor_mode.dart';

@Dependencies([mapCamera, PopUpNotifier])
LatLng? popupLatLngPosition(WidgetRef ref, TripId tripId) {
  final position = ref.watch(popUpProvider);
  if (position == null) return null;

  final camera = ref.read(mapCameraProvider);
  return camera.screenOffsetToLatLng(position);
}

@Dependencies([MapEditor, mapCamera, PopUpNotifier])
class PopupCreateVertex extends ConsumerWidget {
  const PopupCreateVertex({super.key, required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(mapEditorProvider(tripId).notifier);

    return PopupOverlayShell(
      child: TextButton.icon(
        onPressed: () => editor.act((m) {
          final latLng = popupLatLngPosition(ref, tripId);
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
