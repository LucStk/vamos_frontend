import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/user_profile_application.dart';
import 'package:vamos_cartographie/domain_features/auth/providers/providers.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/follow_providers.dart';

// Provider écrit à la main (pas de génération) : le code qui l'utilise
// compile sans relancer build_runner pour lui.

/// Est-ce que l'utilisateur connecté suit [targetId] ?
///
/// Dérivé de [userFollowingProvider] : le bouton « suivre », l'onglet
/// Abonnements et tout ce qui lit cette liste changent ensemble, sans second
/// appel réseau. `AsyncLoading` tant que la liste n'est pas chargée, `false`
/// pour un visiteur ou pour soi-même (on ne se suit pas).
final isFollowingProvider = Provider.autoDispose
    .family<AsyncValue<bool>, UserId>((ref, targetId) {
      final me = ref.watch(currentUserIdProvider);
      if (me == null || me == targetId) return const AsyncValue.data(false);

      return ref
          .watch(userFollowingProvider(me))
          .whenData(
            (following) => following.any((profile) => profile.id == targetId),
          );
    });
