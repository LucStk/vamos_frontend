import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;

  const ConfirmButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.label = 'Confirmer',
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,

      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),

        child: isLoading
            ? const SizedBox(
                key: ValueKey('loading'),
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(label, key: const ValueKey('label')),
      ),
    );
  }
}
