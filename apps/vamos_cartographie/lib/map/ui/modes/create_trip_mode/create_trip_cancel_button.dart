import 'package:flutter/material.dart';

class CreateTripCancelButton extends StatelessWidget {
  const CreateTripCancelButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final error = Theme.of(context).colorScheme.error;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.22),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
              BoxShadow(
                color: error.withValues(alpha: 0.35),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton.filled(
            onPressed: onPressed,
            style: IconButton.styleFrom(
              backgroundColor: error,
              foregroundColor: Theme.of(context).colorScheme.onError,
              fixedSize: const Size(62, 62),
              side: BorderSide(
                color: Colors.white.withValues(alpha: 0.25),
                width: 1.5,
              ),
            ),
            icon: const Icon(Icons.close, size: 24),
            tooltip: 'Annuler la création',
          ),
        ),
      ),
    );
  }
}
