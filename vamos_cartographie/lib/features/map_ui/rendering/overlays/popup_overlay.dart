import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/map_state.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/overlay_state.dart';

import 'package:vamos_cartographie/features/map_editor/map_editor.dart';

class PopUpOverlay extends ConsumerWidget {
  const PopUpOverlay({
    super.key,
    required this.tripId,
    required this.mapController,
  });

  final Id<Trip> tripId;
  final MapController mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapCtrl = ref.watch(mapCtrlProvider(tripId));

    switch (mapCtrl.overlay) {
      case OverlayHidden():
        return const SizedBox.shrink();
      case OverlayPopup popup:
        return StreamBuilder(
          stream: mapController.mapEventStream,
          builder: (context, snapshot) {
            final point = mapController.camera.latLngToScreenOffset(
              popup.element.latLng,
            );

            return Stack(
              children: [
                Positioned(
                  left: point.dx,
                  top: point.dy,
                  child: FractionalTranslation(
                    // -0.5 décale le menu de 50% de sa propre largeur vers la gauche (centrage horizontal)
                    // -1.0 place le bas du menu pile sur le point d'ancrage
                    translation: const Offset(-0.5, -1.0),
                    child: Padding(
                      // On ajoute une marge uniquement en bas pour "pousser" le menu de 8px vers le haut
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: const SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            );
          },
        );
    }
  }
}
