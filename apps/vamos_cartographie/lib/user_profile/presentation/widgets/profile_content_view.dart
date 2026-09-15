import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/auth/providers/auth_controller.dart';
import 'package:vamos_cartographie/user_profile/domain/user_profile.dart';
import 'package:vamos_cartographie/user_profile/presentation/edit_profile_page.dart';
import 'package:vamos_cartographie/user_profile/presentation/widgets/profile_header_view.dart';

class ProfileContent extends ConsumerWidget {
  const ProfileContent({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profil'),
        actions: [
          IconButton(
            tooltip: 'Modifier',
            icon: const Icon(Icons.edit_outlined),
            onPressed: authState.isLoading
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const EditProfilePage(),
                      ),
                    );
                  },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileHeader(profile: profile),

            const SizedBox(height: 32),

            Text('À propos', style: Theme.of(context).textTheme.titleMedium),

            const SizedBox(height: 8),

            Text(
              profile.bio.isEmpty
                  ? 'Aucune biographie renseignée.'
                  : profile.bio,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 32),

            FilledButton.tonal(
              onPressed: authState.isLoading
                  ? null
                  : () => _signOut(context, ref),
              child: authState.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    await ref.read(authControllerProvider.notifier).signOut();

    if (!context.mounted) {
      return;
    }

    final authState = ref.read(authControllerProvider);

    if (authState.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Impossible de se déconnecter : ${authState.error}'),
        ),
      );
    }
  }
}
