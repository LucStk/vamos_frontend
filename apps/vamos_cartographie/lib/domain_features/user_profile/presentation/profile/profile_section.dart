import 'package:flutter/material.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

import '../account/profile_actions_section.dart';
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
    final colors = theme.colorScheme;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450),
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              // Contenu de la carte
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Padding symétrique : réserve la place du bouton des
                    // deux côtés, donc le header reste parfaitement centré.
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Center(child: ProfileHeader(profile: profile)),
                    ),
                    const SizedBox(height: 12),
                    Divider(height: 1, color: colors.outlineVariant),
                    const SizedBox(height: 12),
                    Text(
                      profile.bio.isEmpty
                          ? 'Aucune biographie renseignée.'
                          : profile.bio,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.center,
                      child: ProfileActionsSection(),
                    ),
                  ],
                ),
              ),

              // Bouton modifier par-dessus, hors du flux : il ne décale rien.
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  tooltip: 'Modifier le profil',
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: onEdit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
