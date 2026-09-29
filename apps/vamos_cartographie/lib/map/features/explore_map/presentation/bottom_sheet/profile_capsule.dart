import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';

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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.primaryContainer, // Couleur de fond adaptative au thème
        borderRadius: BorderRadius.circular(12), // Bords très arrondis
      ),
      child: Text(
        profil.profileName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
