import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/core/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/notification_provider.dart';
import 'package:vamos_cartographie/domain_features/auth/providers/providers.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/follow_providers.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/follow_state.dart';
import 'package:vamos_cartographie/ui_kit/ui_kit.dart';

/// « Suivre » / « Suivi », avec confirmation avant de ne plus suivre.
///
/// Absent pour un visiteur (suivre demande un compte) et sur son propre
/// profil. L'affichage suit [isFollowingProvider] : la liste des abonnements
/// est mise à jour de façon optimiste, l'étiquette change donc tout de suite.
class FollowButton extends ConsumerWidget {
  const FollowButton({super.key, required this.profile});

  final UserProfile profile;

  Future<void> _toggle(
    BuildContext context,
    WidgetRef ref,
    bool following,
  ) async {
    final me = ref.read(currentUserIdProvider);
    if (me == null) return;

    if (following) {
      final confirmed = await AskConfirmDialog.show(
        context,
        'Ne plus suivre ${profile.profileName} ?',
      );
      // Page quittée pendant la question : ne touche plus à rien.
      if (confirmed != true || !context.mounted) return;
    }

    final notifier = ref.read(userFollowingProvider(me).notifier);
    // Lu avant l'appel réseau : le bouton peut avoir disparu après.
    final notifications = ref.read(notificationQueueProvider.notifier);
    try {
      following
          ? await notifier.unfollow(profile.id)
          : await notifier.follow(profile);
    } catch (_) {
      notifications.show(
        message: following
            ? 'Impossible de ne plus suivre ${profile.profileName}.'
            : 'Impossible de suivre ${profile.profileName}.',
        type: NotificationType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final me = ref.watch(currentUserIdProvider);
    if (me == null || me == profile.id) return const SizedBox.shrink();

    final state = ref.watch(isFollowingProvider(profile.id));
    // Liste des abonnements pas encore chargée (ou en erreur) : rien à
    // proposer, on ne sait pas dans quel sens irait le bouton.
    final following = state.value;
    if (following == null) return const SizedBox.shrink();

    void onPressed() => _toggle(context, ref, following);

    return following
        ? OutlinedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.check, size: 18),
            label: const Text('Suivi'),
          )
        : FilledButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.person_add_alt, size: 18),
            label: const Text('Suivre'),
          );
  }
}
