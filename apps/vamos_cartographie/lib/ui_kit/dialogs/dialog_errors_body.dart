import 'package:material_ui/material_ui.dart';

class DialogErrorBody extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onClose;

  const DialogErrorBody({super.key, required this.errorMessage, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 12),
          Text(errorMessage, textAlign: TextAlign.center),
          if (onClose != null) ...[
            const SizedBox(height: 16),
            TextButton(onPressed: onClose, child: const Text('Fermer')),
          ],
        ],
      ),
    );
  }
}
