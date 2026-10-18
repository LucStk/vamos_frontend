import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/shared/sheets/floating_card_bottom_sheet.dart';

/// Pousse, réduit et estompe [child] au fil de [progress]
/// (0 = entièrement visible, 1 = absorbé). Inverse d'[AbsorbedSlot].
class AbsorbingCard extends StatelessWidget {
  const AbsorbingCard({super.key, required this.progress, required this.child});

  final ValueListenable<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: progress,
      // Construit une seule fois, réutilisé à chaque frame.
      child: child,
      builder: (context, p, child) => IgnorePointer(
        ignoring: p >= 0.5,
        child: Opacity(
          opacity: 1 - p,
          child: Transform.translate(
            offset: Offset(0, -kFloatingCardMargin * p),
            child: Transform.scale(scale: 1 - 0.06 * p, child: child),
          ),
        ),
      ),
    );
  }
}
