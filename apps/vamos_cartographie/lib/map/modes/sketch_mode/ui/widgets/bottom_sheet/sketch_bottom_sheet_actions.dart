import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/ui/widgets/sheet_action.dart';

class SketchBottomSheetActions extends StatelessWidget {
  const SketchBottomSheetActions({
    super.key,
    required this.onBack,
    required this.onClearRoute,
  });

  final VoidCallback onBack;
  final VoidCallback? onClearRoute;

  Future<void> _confirmClearRoute(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final colors = Theme.of(dialogContext).colorScheme;

        return AlertDialog(
          icon: Icon(Icons.delete_forever_outlined, color: colors.error),
          title: const Text('Effacer toute la route ?'),
          content: const Text(
            'Le tracé et la route calculée seront supprimés.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Annuler'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: colors.error,
                foregroundColor: colors.onError,
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Tout effacer'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      onClearRoute?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      color: colors.surface,
      surfaceTintColor: colors.surfaceTint,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Row(
            children: [
              Expanded(
                child: SheetAction(
                  icon: Icons.arrow_back,
                  label: 'Retour',
                  onPressed: onBack,
                ),
              ),

              Expanded(
                child: SheetAction(
                  icon: Icons.delete_forever_outlined,
                  label: 'Tout effacer',
                  destructive: true,
                  onPressed: onClearRoute == null
                      ? null
                      : () => _confirmClearRoute(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
