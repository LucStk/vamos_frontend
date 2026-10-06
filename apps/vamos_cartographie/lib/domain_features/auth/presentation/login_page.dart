import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../routing/routes/auth_routes.dart';
import 'register_page.dart';
import '/domain_features/auth/providers/auth_controller.dart';
import '/ui_kit/ui_kit.dart';
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
      if (next.hasValue && previous?.isLoading == true) {
        const ProfileRoute().go(context);
        return;
      }

      next.whenOrNull(
        error: (error, stackTrace) {
          final message = error is Failure
              ? error.message
              : 'Impossible de se connecter. Veuillez réessayer.';

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(message)));
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
        const SizedBox(height: 16),
        TextButton(
          onPressed: isLoading
              ? null
              : () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                  );
                },
          child: const Text('Créer un compte'),
        ),
      ],
    );
  }
}
