import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';

import 'package:vamos_cartographie/features/map/presentation/controllers/controllers.dart';

class VertexPopUpOverlay extends ConsumerWidget {
  const VertexPopUpOverlay({
    super.key,
    required this.tripId,
    required this.mapController,
  });

  final Id<Trip> tripId;
  final MapController mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popup = ref.watch(mapPopupProvider(tripId));

    if (popup == null) {
      return const SizedBox.shrink();
    }

    // On utilise un ListenableBuilder branché sur le mapController.mapEventStream
    // pour forcer le widget à recalculer l'Offset à chaque mouvement de carte.
    return StreamBuilder(
      stream: mapController.mapEventStream,
      builder: (context, snapshot) {
        final point = mapController.camera.latLngToScreenOffset(popup.latLng);

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
                  child: popup.popUp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
