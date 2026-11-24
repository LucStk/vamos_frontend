import 'package:flutter/material.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

/// Une ligne d'utilisateur : photo, nom et début de la biographie, et ce que
/// [trailing] met au bout (un chevron dans la recherche, le bouton « suivre »
/// dans les abonnements).
///
/// Partagée par la recherche d'utilisateurs et les listes du profil, pour
/// qu'un utilisateur se présente partout pareil.
class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    required this.onTap,
    this.trailing,
  });

  final UserProfile user;
  final VoidCallback onTap;
  final Widget? trailing;

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
      trailing: trailing,
      onTap: onTap,
    );
  }
}
