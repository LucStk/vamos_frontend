import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/domain.dart';
import "/domain_features/user_profile/user_profile.dart";

class ProfileCapsule extends ConsumerWidget {
  const ProfileCapsule({super.key, required this.userId});
  final UserId userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profil = ref.watch(userProfileProvider(userId));
    final textTheme = Theme.of(context).textTheme;
    if (profil == null) {
      throw NotFoundFailure(resourceId: userId.value, resourceType: "profile");
    }
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
