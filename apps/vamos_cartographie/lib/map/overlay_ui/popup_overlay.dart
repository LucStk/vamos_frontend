import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/gesture_state_provider.dart';
import '/map/map.dart';

class PopUpOverlay extends ConsumerWidget {
  const PopUpOverlay({super.key, required this.tripId});

  final Id<Trip> tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sketchPencileSelected = ref.watch(
      mapStateProvider(tripId).select((s) {
        return s.selection is MapSketchPencil;
      }),
    );

    if (sketchPencileSelected) {
      final point = ref.watch(pencilePositionProvider(tripId));
      if (point == null) return SizedBox.shrink();
      print("sketchPencile selected $point");

      return Stack(
        children: [
          Positioned(
            left: point.x,
            top: point.y,
            child: FractionalTranslation(
              // -0.5 décale le menu de 50% de sa propre largeur vers la gauche (centrage horizontal)
              // -1.0 place le bas du menu pile sur le point d'ancrage
              translation: const Offset(-0.5, -1.0),
              child: Padding(
                // On ajoute une marge uniquement en bas pour "pousser" le menu de 8px vers le haut
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(width: 12, height: 12, color: Colors.red),
              ),
            ),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
