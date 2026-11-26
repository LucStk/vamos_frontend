import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/auth/auth.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/recent_trips_provider.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/user_tile.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/favorite_trips_providers.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/follow_providers.dart';
import 'package:vamos_cartographie/map/ui/chrome/account_button.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_scope.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';
import 'package:vamos_cartographie/routing/trip_navigation.dart';

/// Panneau de compte : se déplie depuis le bord gauche, prend toute la hauteur
/// et la moitié de la largeur sur téléphone. En haut, le compte (profil,
/// déconnexion, ou connexion pour un visiteur) ; dessous, trois onglets
/// dépliants : les voyages vus récemment, les favoris, les abonnements.
///
/// À afficher dans un `OverlayPortal`. [onClosed] est appelé **après** le
/// repli : c'est là qu'on retire la surcouche.
class AccountPanel extends ConsumerStatefulWidget {
  const AccountPanel({super.key, required this.onClosed});

  final VoidCallback onClosed;

  @override
  ConsumerState<AccountPanel> createState() => _AccountPanelState();
}

class _AccountPanelState extends ConsumerState<AccountPanel>
    with SingleTickerProviderStateMixin {
  /// Moitié de l'écran sur téléphone, plafonnée pour qu'un grand écran n'ait
  /// pas un panneau démesuré.
  static const _maxWidth = 360.0;

  late final AnimationController _anim = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
  );

  late final Animation<double> _curve = CurvedAnimation(
    parent: _anim,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );

  BackInterceptors? _back;

  @override
  void initState() {
    super.initState();
    _anim.forward();

    // Après le frame : `set` notifie le `BackScope`, et le registre se cherche
    // dans un arbre déjà monté.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final back = _back = BackScope.interceptorsOf(context);
      back?.set(this, _close);
    });
  }

  @override
  void dispose() {
    final back = _back;
    // Même raison, et l'arbre est verrouillé pendant `dispose`.
    WidgetsBinding.instance.addPostFrameCallback((_) => back?.set(this, null));
    _anim.dispose();
    super.dispose();
  }

  /// Replie le panneau vers le bord gauche, puis le retire.
  Future<void> _close() async {
    await _anim.reverse();
    if (mounted) widget.onClosed();
  }

  Future<void> _signOut() async {
    // Lu avant le repli : après, ce `ref` n'existe plus.
    final container = ProviderScope.containerOf(context);
    await _close();
    await container.read(authControllerProvider.notifier).signOut();
  }

  @override
  Widget build(BuildContext context) {
    final width = math.min(_maxWidth, MediaQuery.sizeOf(context).width / 2);

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FadeTransition(
            opacity: _curve,
            child: ModalBarrier(color: Colors.black26, onDismiss: _close),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SlideTransition(
              position: Tween(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_curve),
              child: SizedBox(
                width: width,
                height: double.infinity,
                child: Material(
                  elevation: 8,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _AccountBox(onClose: _close, onSignOut: _signOut),
                        const Divider(height: 1),
                        Expanded(child: _Sections(onClose: _close)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Le haut du panneau : l'utilisateur et ce qu'il peut faire de son compte.
class _AccountBox extends ConsumerWidget {
  const _AccountBox({required this.onClose, required this.onSignOut});

  final VoidCallback onClose;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Un visiteur n'a rien à voir ici que « se connecter ».
    final isLoggedIn = ref.watch(currentUserIdProvider) != null;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          if (isLoggedIn)
            const LoggedInAccountContent()
          else
            const CircleAvatar(radius: 18, child: Icon(Icons.person_outline)),
          const Spacer(),
          if (isLoggedIn) ...[
            IconButton(
              tooltip: 'Mon profil',
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {
                const ProfileRoute().push(context);
                onClose();
              },
            ),
            IconButton(
              tooltip: 'Se déconnecter',
              icon: const Icon(Icons.logout),
              onPressed: onSignOut,
            ),
          ] else
            FilledButton.tonal(
              onPressed: () {
                const LoginRoute().push(context);
                onClose();
              },
              child: const Text('Connexion'),
            ),
        ],
      ),
    );
  }
}

/// Les trois onglets. Le panneau entier défile si on les ouvre tous.
class _Sections extends ConsumerWidget {
  const _Sections({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final me = ref.watch(currentUserIdProvider);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _Section(title: 'Récent', child: _RecentTripsList(onClose: onClose)),
        _Section(
          title: 'Favoris',
          child: me == null
              ? const _Message('Connectez-vous pour avoir des favoris.')
              : _FavoriteTripsList(userId: me, onClose: onClose),
        ),
        _Section(
          title: 'Abonnements',
          child: me == null
              ? const _Message('Connectez-vous pour suivre des voyageurs.')
              : _FollowingList(userId: me, onClose: onClose),
        ),
      ],
    );
  }
}

/// Un onglet dépliant, dont le contenu est borné en hauteur : au-delà, il
/// défile sur place plutôt que d'allonger le panneau.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  static const _maxHeight = 240.0;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      // Sans ça, un onglet ouvert se borde de deux liserés.
      shape: const Border(),
      collapsedShape: const Border(),
      childrenPadding: EdgeInsets.zero,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: _maxHeight),
          child: child,
        ),
      ],
    );
  }
}

/// Les voyages vus récemment, gardés sur l'appareil.
class _RecentTripsList extends ConsumerWidget {
  const _RecentTripsList({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(recentTripsProvider);
    if (trips.isEmpty) {
      return const _Message('Aucun voyage vu récemment.');
    }

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        for (final trip in trips)
          _TripRow(
            title: trip.title,
            onTap: () {
              openTripOnMap(context, ref, trip.id);
              onClose();
            },
          ),
      ],
    );
  }
}

/// Les favoris, qui demandent un compte.
class _FavoriteTripsList extends ConsumerWidget {
  const _FavoriteTripsList({required this.userId, required this.onClose});

  final UserId userId;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final load = ref.watch(loadFavoriteTripsProvider(userId));
    final trips = ref.watch(favoriteTripSummariesProvider(userId));

    // Un rechargement garde la liste affichée : seul le premier chargement
    // montre la roue.
    if (trips.isEmpty) {
      if (load.isLoading) return const _Loading();
      if (load.hasError) return const _Message('Favoris indisponibles.');
      return const _Message('Aucun favori.');
    }

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        for (final summary in trips)
          _TripRow(
            title: summary.trip.title,
            onTap: () {
              openTripOnMap(context, ref, summary.trip.id);
              onClose();
            },
          ),
      ],
    );
  }
}

/// Les voyageurs que l'utilisateur suit.
class _FollowingList extends ConsumerWidget {
  const _FollowingList({required this.userId, required this.onClose});

  final UserId userId;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(userFollowingProvider(userId))) {
      AsyncError() => const _Message('Abonnements indisponibles.'),
      AsyncData(value: final users) when users.isEmpty => const _Message(
        'Vous ne suivez personne.',
      ),
      AsyncData(value: final users) => ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          for (final user in users)
            UserTile(
              user: user,
              onTap: () {
                UserProfileRoute(user.id.value).push(context);
                onClose();
              },
            ),
        ],
      ),
      _ => const _Loading(),
    };
  }
}

class _TripRow extends StatelessWidget {
  const _TripRow({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.route_outlined),
      title: Text(
        title.isEmpty ? 'Voyage sans titre' : title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _Message extends StatelessWidget {
  const _Message(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
