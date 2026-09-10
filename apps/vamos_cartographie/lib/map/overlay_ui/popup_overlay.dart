import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/map_scene_provider.dart';

class PopUpOverlay extends ConsumerWidget {
  const PopUpOverlay({super.key, required this.tripId});

  final Id<Trip> tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final point = ref.watch(projectSketchPencilProvider(tripId));

    if (point == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
      left: point.projectedPosition.dx,
      top: point.projectedPosition.dy,
      child: FractionalTranslation(
        translation: const Offset(-0.5, -1.5),
        child: _PencilPopup(
          onCreateStep: () {
            // TODO: déclencher la création de l'étape
          },
        ),
      ),
    );
  }
}

class _PencilPopup extends StatelessWidget {
  const _PencilPopup({required this.onCreateStep});

  final VoidCallback onCreateStep;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.surface,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: TextButton.icon(
              onPressed: onCreateStep,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Créer étape ici'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),

        // Petite pointe qui indique le point géographique.
        CustomPaint(
          size: const Size(18, 9),
          painter: _PopupArrowPainter(color: theme.colorScheme.surface),
        ),
      ],
    );
  }
}

class _PopupArrowPainter extends CustomPainter {
  const _PopupArrowPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_PopupArrowPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
