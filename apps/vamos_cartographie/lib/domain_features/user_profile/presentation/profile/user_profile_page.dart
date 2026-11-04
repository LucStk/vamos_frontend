// domain_features/user_profile/presentation/profile/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/user_profile/user_profile.dart';

/// Profil public d'un autre utilisateur : lecture seule.
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key, required this.userId});

  final UserId userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(userProfileProvider(userId));

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: switch (profileState) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncError() => const _ProfileError(),
        AsyncData(value: null) => const _ProfileError(),
        AsyncData(value: final profile) => _ProfileBody(profile: profile!),
      },
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = profile.profilePictureUrl;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: CircleAvatar(
            radius: 48,
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
            child: imageUrl == null ? const Icon(Icons.person, size: 48) : null,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          profile.profileName,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 24),

        // TODO : liste des voyages publics de cet utilisateur.
        // Il vous faut un provider du type publicTripsProvider(userId).
      ],
    );
  }
}

class _ProfileError extends StatelessWidget {
  const _ProfileError();

  @override
  Widget build(BuildContext context) => const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: Text('Ce profil est introuvable.', textAlign: TextAlign.center),
    ),
  );
}
