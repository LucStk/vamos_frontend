import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    // TODO:
    // Enregistrer le profil auprès de Django.
    //
    // Exemple :
    //
    // await ref
    //     .read(profileControllerProvider.notifier)
    //     .createProfile(
    //       displayName: _displayNameController.text.trim(),
    //     );

    if (!mounted) {
      return;
    }

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const Placeholder()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.person_outline, size: 64),

                    const SizedBox(height: 24),

                    Text(
                      'Bienvenue !',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Créons votre profil',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Choisissez le nom sous lequel vous '
                      'serez identifié dans l’application.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    const SizedBox(height: 32),

                    TextFormField(
                      controller: _displayNameController,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.words,
                      autofillHints: const [AutofillHints.nickname],
                      onFieldSubmitted: (_) => _createProfile(),
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
                    ),

                    const SizedBox(height: 24),

                    FilledButton(
                      onPressed: _createProfile,
                      child: const Text('Continuer'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
