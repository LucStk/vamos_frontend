import 'package:flutter/material.dart';
import 'package:user_profile_application/domain/domain.dart';

class ProfileCapsule extends StatelessWidget {
  const ProfileCapsule({super.key, required this.profil});
  final UserProfile profil;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final imageUrl = profil.profilePictureUrl;
    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        onTap: () {
          // Ouvrir le profil
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: imageUrl != null
                    ? NetworkImage(imageUrl)
                    : null,
                child: imageUrl == null ? const Icon(Icons.person) : null,
              ),
              const SizedBox(width: 6),
              Text(
                profil.profileName,
                style: textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
