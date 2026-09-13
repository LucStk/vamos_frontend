import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;

  const EmailField({super.key, required this.controller, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.username, AutofillHints.email],
      decoration: const InputDecoration(
        labelText: 'Adresse e-mail',
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        final email = value?.trim() ?? '';
        if (email.isEmpty) {
          return 'Veuillez saisir votre adresse e-mail';
        }
        if (!email.contains('@')) {
          return 'Adresse e-mail invalide';
        }
        return null;
      },
    );
  }
}
