import 'package:flutter/material.dart';
import 'package:vamos_cartographie/user_profile/domain/user_profile.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 56,
          backgroundImage: profile.profilePictureUrl != null
              ? NetworkImage(profile.profilePictureUrl!)
              : null,
          child: profile.profilePictureUrl == null
              ? const Icon(Icons.person_outline, size: 56)
              : null,
        ),
        const SizedBox(height: 16),

        Text(
          profile.profileName,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
