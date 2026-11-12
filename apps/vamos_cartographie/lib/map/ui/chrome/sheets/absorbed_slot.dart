import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// Fait apparaître le contenu (hauteur + opacité) au fil de [progress].
class AbsorbedSlot extends StatelessWidget {
  final ValueListenable<double> progress;
  final Widget child;

  const AbsorbedSlot({super.key, required this.progress, required this.child});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: progress,
      child: child,
      builder: (context, p, child) {
        if (p <= 0) return const SizedBox.shrink();
        return ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: p,
            child: Opacity(opacity: p, child: child),
          ),
        );
      },
    );
  }
}
