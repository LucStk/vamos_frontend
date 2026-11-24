import 'package:flutter/material.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

/// Une ligne de résultat : avatar, nom et début de la biographie.
class UserSearchTile extends StatelessWidget {
  const UserSearchTile({super.key, required this.user, required this.onTap});

  final UserProfile user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final imageUrl = user.profilePictureUrl;

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
        child: imageUrl == null ? const Icon(Icons.person_outline) : null,
      ),
      title: Text(
        user.profileName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: user.bio.isEmpty
          ? null
          : Text(user.bio, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
