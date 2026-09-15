import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/auth/presentation/widgets/auth_layout.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/user_profile/user_profile.dart';

class CreateProfilePage extends ConsumerStatefulWidget {
  const CreateProfilePage({super.key});

  @override
  ConsumerState<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends ConsumerState<CreateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();

  String? _errorMessage;
  bool _isLoading = false;

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

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Appel de la méthode sur le Notifier
    final failure = await ref
        .read(meProvider.notifier)
        .createProfile(_displayNameController.text);

    if (!mounted) return;

    if (failure != null) {
      // Cas d'erreur : un Failure a été retourné
      setState(() {
        _isLoading = false;
        _errorMessage = failure.message;
      });
    } else {
      // Cas de succès : failure est null, le state Riverpod est déjà à jour (AsyncData)
      setState(() {
        _isLoading = false;
      });

      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const ProfilePage()));
    }
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
          onChanged: (_) {
            if (_errorMessage != null) {
              setState(() {
                _errorMessage = null;
              });
            }
          },
        ),
        if (_errorMessage != null) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 16,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 24),
        PrimaryButton(
          label: _isLoading ? 'Création en cours...' : 'Continuer',
          onPressed: _isLoading ? null : _createProfile,
        ),
      ],
    );
  }
}
