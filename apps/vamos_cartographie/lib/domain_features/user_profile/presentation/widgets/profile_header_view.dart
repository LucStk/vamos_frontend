import 'package:flutter/material.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import '/domain_features/stored_file/stored_file.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePicture(imageUrl: profile.profilePictureUrl),
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
