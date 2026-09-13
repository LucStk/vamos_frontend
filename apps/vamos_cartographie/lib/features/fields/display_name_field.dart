import 'package:flutter/material.dart';

class DisplayNameField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final ValueChanged<String>? onFieldSubmitted;

  const DisplayNameField({
    super.key,
    required this.controller,
    this.enabled = true,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.words,
      autofillHints: const [AutofillHints.nickname],
      onFieldSubmitted: onFieldSubmitted,
      decoration: const InputDecoration(
        labelText: 'Nom d’affichage',
        hintText: 'Votre nom',
        prefixIcon: Icon(Icons.person_outline),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        final name = value?.trim() ?? '';
        if (name.isEmpty) {
          return 'Veuillez saisir un nom';
        }
        if (name.length < 2) {
          return 'Le nom doit contenir au moins 2 caractères';
        }
        if (name.length > 50) {
          return 'Le nom ne peut pas dépasser 50 caractères';
        }
        return null;
      },
    );
  }
}
