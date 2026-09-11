import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/auth/auth_controller.dart';

// Imports des nouveaux widgets
import 'widgets/widgets.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.listenManual(authControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(_errorMessage(error))));
        },
        data: (_) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Compte créé. Vérifiez votre adresse e-mail.'),
              ),
            );
        },
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    await ref
        .read(authControllerProvider.notifier)
        .signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    return AuthLayout(
      formKey: _formKey,
      icon: Icons.person_add_outlined,
      title: 'Créer un compte',
      subtitle: 'Créez votre compte pour commencer',
      children: [
        EmailField(controller: _emailController, enabled: !isLoading),
        const SizedBox(height: 16),
        PasswordField(
          controller: _passwordController,
          enabled: !isLoading,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez saisir un mot de passe';
            }
            if (value.length < 8) {
              return 'Le mot de passe doit contenir au moins 8 caractères';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        PasswordField(
          controller: _confirmationController,
          label: 'Confirmer le mot de passe',
          enabled: !isLoading,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => _signUp(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez confirmer votre mot de passe';
            }
            if (value != _passwordController.text) {
              return 'Les mots de passe ne correspondent pas';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          label: 'Créer mon compte',
          isLoading: isLoading,
          onPressed: _signUp,
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('J’ai déjà un compte'),
        ),
      ],
    );
  }

  String _errorMessage(Object error) {
    final message = error.toString();

    if (message.contains('User already registered')) {
      return 'Un compte existe déjà avec cette adresse e-mail.';
    }
    if (message.contains('Password should be at least')) {
      return 'Le mot de passe est trop court.';
    }
    if (message.contains('Unable to validate email')) {
      return 'Adresse e-mail invalide.';
    }

    return 'Une erreur est survenue lors de la création du compte.';
  }
}
