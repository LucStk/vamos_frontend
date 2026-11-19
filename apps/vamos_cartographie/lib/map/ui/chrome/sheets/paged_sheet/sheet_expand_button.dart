import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/paged_sheet_scope.dart';

/// Petit chevron à placer dans une page : déplie la sheet au repos, la replie
/// une fois dépliée. Invisible hors d'une [DraggableBottomSheetShell].
class SheetExpandButton extends StatelessWidget {
  const SheetExpandButton({super.key});

  @override
  Widget build(BuildContext context) {
    final scope = PagedSheetScope.maybeOf(context);
    if (scope == null) return const SizedBox.shrink();
    final color = Theme.of(context).colorScheme.onSurfaceVariant;

    return ValueListenableBuilder<bool>(
      valueListenable: scope.isAtMin,
      builder: (context, atMin, _) => IconButton(
        visualDensity: VisualDensity.compact,
        tooltip: atMin ? 'Afficher les détails' : 'Réduire',
        onPressed: scope.toggle,
        icon: AnimatedRotation(
          turns: atMin ? 0 : 0.5,
          duration: const Duration(milliseconds: 200),
          child: Icon(Icons.expand_less, size: 20, color: color),
        ),
      ),
    );
  }
}
