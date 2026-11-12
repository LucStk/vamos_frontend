import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/domain.dart';

class ProfileCapsule extends StatelessWidget {
  const ProfileCapsule({super.key, required this.profil, this.onTap});

  /// loading → squelette, error / data null → capsule d'erreur,
  /// data → capsule normale.
  final AsyncValue<UserProfile?> profil;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return profil.when(
      loading: () => const _CapsuleLoading(),
      error: (_, __) => const _CapsuleError(),
      data: (p) => p == null
          ? const _CapsuleError()
          : _CapsuleData(profil: p, onTap: onTap),
    );
  }
}

/// État nominal (ton ancien build).
class _CapsuleData extends StatelessWidget {
  const _CapsuleData({required this.profil, this.onTap});

  final UserProfile profil;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = profil.profilePictureUrl;

    return _CapsuleShell(
      background: theme.colorScheme.primaryContainer,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
            child: imageUrl == null ? const Icon(Icons.person) : null,
          ),
          const SizedBox(width: 6),
          Text(
            profil.profileName,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Chargement : même gabarit, avatar + barre de texte grisés.
class _CapsuleLoading extends StatelessWidget {
  const _CapsuleLoading();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final placeholder = theme.colorScheme.onSurface.withValues(alpha: 0.12);

    return _CapsuleShell(
      background: theme.colorScheme.surfaceContainerHighest,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 18, backgroundColor: placeholder),
          const SizedBox(width: 6),
          Container(
            width: 70,
            height: 10,
            decoration: BoxDecoration(
              color: placeholder,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}

// _CapsuleError et _CapsuleShell restent inchangés.

/// Profil introuvable : même gabarit, couleurs d'erreur, non cliquable.
class _CapsuleError extends StatelessWidget {
  const _CapsuleError();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _CapsuleShell(
      background: theme.colorScheme.errorContainer,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: theme.colorScheme.error,
            child: Icon(
              Icons.person_off_outlined,
              size: 18,
              color: theme.colorScheme.onError,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'Profil indisponible',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onErrorContainer,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Gabarit commun : même forme et mêmes dimensions dans tous les états,
/// pour que la capsule ne saute pas quand le profil arrive.
class _CapsuleShell extends StatelessWidget {
  const _CapsuleShell({
    required this.background,
    required this.child,
    this.onTap,
  });

  final Color background;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const radius = BorderRadius.all(Radius.circular(17));

    return Material(
      color: background,
      borderRadius: radius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: child,
        ),
      ),
    );
  }
}
