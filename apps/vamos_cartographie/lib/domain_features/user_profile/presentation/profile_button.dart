import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/domain_features/auth/providers/auth_providers.dart';

import '/domain_features/user_profile/providers/providers.dart';

class ProfileButton extends ConsumerWidget {
  const ProfileButton({
    super.key,
    required this.onLogin,
    required this.onProfile,
  });

  final VoidCallback onLogin;
  final VoidCallback onProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      loading: () => const _ProfileButtonPlaceholder(),

      error: (_, __) => _LoggedOutProfileButton(onPressed: onLogin),

      data: (user) {
        if (user == null) {
          return _LoggedOutProfileButton(onPressed: onLogin);
        }

        return _LoggedInProfileButton(onPressed: onProfile);
      },
    );
  }
}

class _LoggedOutProfileButton extends StatelessWidget {
  const _LoggedOutProfileButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: 'Se connecter',
      icon: const Icon(Icons.person_outline),
    );
  }
}

class _LoggedInProfileButton extends ConsumerWidget {
  const _LoggedInProfileButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meState = ref.watch(meProvider);

    final imageUrl = switch (meState) {
      AsyncData(value: final me) => me.profile?.profilePictureUrl,
      _ => null,
    };

    return IconButton(
      onPressed: onPressed,
      tooltip: 'Mon profil',
      icon: CircleAvatar(
        radius: 18,
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
        child: imageUrl == null ? const Icon(Icons.person) : null,
      ),
    );
  }
}

class _ProfileButtonPlaceholder extends StatelessWidget {
  const _ProfileButtonPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 48,
      height: 48,
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
