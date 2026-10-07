import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

import '../injection/map_mode.dart';

@Dependencies([mapDecorator])
class PopupOverlayShell extends ConsumerWidget {
  const PopupOverlayShell({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = ref.watch(mapDecoratorProvider);

    if (d is! PopupDecorator) return const SizedBox.shrink();

    return Positioned(
      left: d.at.dx,
      top: d.at.dy,
      child: FractionalTranslation(
        translation: const Offset(-0.5, -1.5),
        child: _PencilPopupContent(child: child),
      ),
    );
  }
}

class _PencilPopupContent extends StatelessWidget {
  const _PencilPopupContent({required this.child});

  final Widget child;

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
          child: Padding(padding: const EdgeInsets.all(6), child: child),
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
