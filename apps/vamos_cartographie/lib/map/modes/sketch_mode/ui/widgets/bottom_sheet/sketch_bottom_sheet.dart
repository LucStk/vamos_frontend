import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/ui/widgets/bottom_sheet/sketch_bottom_sheet_actions.dart';

class SketchBottomSheet extends StatelessWidget {
  const SketchBottomSheet({
    super.key,
    required this.onBack,
    required this.onRoute,
    required this.onCancelStroke,
    required this.onClearRoute,
    this.contextualSheet,
  });

  final VoidCallback onBack;
  final VoidCallback? onRoute;
  final VoidCallback? onCancelStroke;
  final VoidCallback? onClearRoute;
  final Widget? contextualSheet;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (contextualSheet != null) ...[
              contextualSheet!,
              const SizedBox(height: 10),
            ],
            SketchBottomSheetActions(
              onBack: onBack,
              onClearRoute: onClearRoute,
            ),
          ],
        ),
      ),
    );
  }
}
