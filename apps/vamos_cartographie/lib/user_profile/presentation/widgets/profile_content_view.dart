import 'package:flutter/material.dart';
import 'package:vamos_cartographie/user_profile/domain/user_profile.dart';
import 'package:vamos_cartographie/user_profile/presentation/edit_profile_page.dart';
import 'package:vamos_cartographie/user_profile/presentation/widgets/profile_header_view.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profil'),
        actions: [
          IconButton(
            tooltip: 'Modifier',
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const EditProfilePage()),
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
          ],
        ),
      ),
    );
  }
}
