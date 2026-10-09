import 'package:flutter/material.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

import 'profile_header_view.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.profile,
    required this.onEdit,
  });

  final UserProfile profile;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text('Mon profil', style: theme.textTheme.titleLarge),
            ),
            IconButton(
              tooltip: 'Modifier le profil',
              icon: const Icon(Icons.edit_outlined),
              onPressed: onEdit,
            ),
          ],
        ),
        const SizedBox(height: 16),

        ProfileHeader(profile: profile),

        const SizedBox(height: 32),

        Text('À propos', style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),

        Text(
          profile.bio.isEmpty ? 'Aucune biographie renseignée.' : profile.bio,
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
