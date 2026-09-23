import 'package:flutter/material.dart';

class DialogLoadingBody extends StatelessWidget {
  final String message;

  const DialogLoadingBody({
    super.key,
    this.message = 'Chargement…', // Valeur par défaut
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(message),
        ],
      ),
    );
  }
}
