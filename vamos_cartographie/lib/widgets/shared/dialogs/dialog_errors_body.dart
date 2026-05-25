import 'package:flutter/material.dart';

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
          const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
          const SizedBox(height: 12),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
          if (onClose != null) ...[
            const SizedBox(height: 16),
            TextButton(onPressed: onClose, child: const Text('Fermer')),
          ],
        ],
      ),
    );
  }
}
