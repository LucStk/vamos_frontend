import 'package:flutter/material.dart';

// Imports des widgets partagés
import 'widgets/auth_layout.dart';
import 'widgets/primary_button.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      icon: Icons.mark_email_read_outlined,
      title: 'Vérifiez votre e-mail',
      subtitle: 'Votre compte a bien été créé.',
      children: [
        Text(
          'Nous avons envoyé un e-mail de confirmation à :',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          email,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Text(
          'Cliquez sur le lien présent dans cet e-mail '
          'pour confirmer votre adresse et terminer '
          'la création de votre compte.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
        PrimaryButton(
          label: 'Retour à la connexion',
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            // TODO: Ajouter le renvoi de l'e-mail de confirmation.
          },
          child: const Text('Renvoyer l’e-mail'),
        ),
      ],
    );
  }
}
