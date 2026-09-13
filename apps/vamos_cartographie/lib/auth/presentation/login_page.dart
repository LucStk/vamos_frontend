import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/auth/auth_controller.dart';
import 'package:vamos_cartographie/features/buttons/primary_button.dart';
import 'package:vamos_cartographie/features/fields/fields.dart';

// Imports des nouveaux widgets
import 'widgets/auth_layout.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    await ref
        .read(authControllerProvider.notifier)
        .signIn(
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
      icon: Icons.lock_outline,
      title: 'Connexion',
      subtitle: 'Connectez-vous à votre compte',
      children: [
        EmailField(controller: _emailController, enabled: !isLoading),
        const SizedBox(height: 16),
        PasswordField(
          controller: _passwordController,
          enabled: !isLoading,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => _signIn(),
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          label: 'Se connecter',
          isLoading: isLoading,
          onPressed: _signIn,
        ),
      ],
    );
  }

  String _errorMessage(Object error) {
    final message = error.toString();
    if (message.contains('Invalid login credentials')) {
      return 'Adresse e-mail ou mot de passe incorrect.';
    }
    if (message.contains('Email not confirmed')) {
      return 'Veuillez confirmer votre adresse e-mail avant de vous connecter.';
    }
    return 'Impossible de se connecter. Veuillez réessayer.';
  }
}
