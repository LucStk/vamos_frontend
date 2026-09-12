import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Imports des widgets partagés
import 'widgets/auth_layout.dart';
import 'widgets/display_name_field.dart';
import 'widgets/primary_button.dart';

class CreateProfilePage extends ConsumerStatefulWidget {
  const CreateProfilePage({super.key});

  @override
  ConsumerState<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends ConsumerState<CreateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();

  @override
  void dispose() {
    _displayNameController.dispose();
    super.dispose();
  }

  Future<void> _createProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    // TODO: Enregistrer le profil auprès de Django.

    if (!mounted) {
      return;
    }

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const Placeholder()));
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      formKey: _formKey,
      icon: Icons.person_outline,
      title: 'Bienvenue !',
      subtitle: 'Créons votre profil',
      children: [
        Text(
          'Choisissez le nom sous lequel vous '
          'serez identifié dans l’application.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
        DisplayNameField(
          controller: _displayNameController,
          onFieldSubmitted: (_) => _createProfile(),
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Continuer', onPressed: _createProfile),
      ],
    );
  }
}
