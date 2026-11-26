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
/// et la moitié de la largeur sur téléphone. En haut, le compte (avatar, puis
/// profil et déconnexion, ou connexion pour un visiteur) ; dessous, trois
/// onglets dépliants : les voyages vus récemment, les favoris, les
/// abonnements.
///
/// Se referme en le glissant vers la gauche, par le voile, par le retour
/// Android ou par Échap.
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

  static const _duration = Duration(milliseconds: 220);

  /// 0 : replié hors de l'écran, 1 : ouvert. Pris tel quel par le glissement,
  /// pour que le panneau suive le doigt ; les courbes sont demandées à
  /// l'animation, pas au `SlideTransition`.
  late final AnimationController _anim = AnimationController(
    vsync: this,
    duration: _duration,
  );

  BackInterceptors? _back;

  @override
  void initState() {
    super.initState();
    _anim.animateTo(1, curve: Curves.easeOutCubic);

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

  double _panelWidth() =>
      math.min(_maxWidth, MediaQuery.sizeOf(context).width / 2);

  /// Replie le panneau vers le bord gauche, puis le retire.
  Future<void> _close() async {
    await _anim.animateBack(0, curve: Curves.easeInCubic);
    if (mounted) widget.onClosed();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final width = _panelWidth();
    if (width == 0) return;
    // Le setter borne à [0, 1] : tirer vers la droite n'écarte pas le panneau
    // du bord.
    _anim.value += (details.primaryDelta ?? 0) / width;
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;

    // Geste franc : la direction décide, où que le panneau soit rendu.
    if (velocity < -300) return _close().ignore();
    if (velocity > 300) {
      _anim.animateTo(1, curve: Curves.easeOut);
      return;
    }

    // Geste mou : le panneau rejoint le bord le plus proche.
    if (_anim.value >= 0.5) {
      _anim.animateTo(1, curve: Curves.easeOut);
    } else {
      _close().ignore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FadeTransition(
            opacity: _anim,
            child: ModalBarrier(color: Colors.black26, onDismiss: _close),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SlideTransition(
              position: Tween(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_anim),
              child: GestureDetector(
                // Glisser le panneau vers la gauche le referme. Seul
                // l'horizontal est capté : les listes défilent toujours.
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                child: SizedBox(
                  width: _panelWidth(),
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
          ),
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    // Lu avant le repli : après, ce `ref` n'existe plus.
    final container = ProviderScope.containerOf(context);
    await _close();
    await container.read(authControllerProvider.notifier).signOut();
  }
}

/// Le haut du panneau : l'avatar, puis ce que l'utilisateur peut faire de son
/// compte. En colonne, car à la moitié d'un écran de téléphone l'avatar et des
/// boutons libellés ne tiennent pas sur une ligne.
class _AccountBox extends ConsumerWidget {
  const _AccountBox({required this.onClose, required this.onSignOut});

  final VoidCallback onClose;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Un visiteur n'a rien à voir ici que « se connecter ».
    final isLoggedIn = ref.watch(currentUserIdProvider) != null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: isLoggedIn
                ? const LoggedInAccountContent()
                : const CircleAvatar(
                    radius: 18,
                    child: Icon(Icons.person_outline),
                  ),
          ),
          const SizedBox(height: 12),
          if (isLoggedIn) ...[
            FilledButton.tonalIcon(
              onPressed: () {
                const ProfileRoute().push(context);
                onClose();
              },
              style: FilledButton.styleFrom(
                visualDensity: VisualDensity.compact,
              ),
              icon: const Icon(Icons.account_circle_outlined, size: 18),
              label: const Text('Mon profil'),
            ),
            const SizedBox(height: 4),
            TextButton.icon(
              onPressed: onSignOut,
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
              ),
              icon: const Icon(Icons.logout, size: 18),
              label: const Text('Se déconnecter'),
            ),
          ] else
            FilledButton.tonalIcon(
              onPressed: () {
                const LoginRoute().push(context);
                onClose();
              },
              style: FilledButton.styleFrom(
                visualDensity: VisualDensity.compact,
              ),
              icon: const Icon(Icons.login, size: 18),
              label: const Text('Connexion'),
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
    // Null : visiteur. Favoris et abonnements demandent un compte, donc ils
    // n'ont rien à déplier.
    final me = ref.watch(currentUserIdProvider);

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 4),
      children: [
        _RecentSection(onClose: onClose),
        _FavoritesSection(userId: me, onClose: onClose),
        _FollowingSection(userId: me, onClose: onClose),
      ],
    );
  }
}

class _RecentSection extends ConsumerWidget {
  const _RecentSection({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(recentTripsProvider);

    return _Section(
      icon: Icons.history,
      title: 'Récent',
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

class _FavoritesSection extends ConsumerWidget {
  const _FavoritesSection({required this.userId, required this.onClose});

  final UserId? userId;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = userId;
    if (id == null) {
      return const _Section(icon: Icons.bookmark_border, title: 'Favoris');
    }

    final load = ref.watch(loadFavoriteTripsProvider(id));
    final trips = ref.watch(favoriteTripSummariesProvider(id));

    return _Section(
      icon: Icons.bookmark_border,
      title: 'Favoris',
      trailing: trips.isEmpty
          ? _statusIcon(
              context,
              isLoading: load.isLoading,
              hasError: load.hasError,
            )
          : null,
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

class _FollowingSection extends ConsumerWidget {
  const _FollowingSection({required this.userId, required this.onClose});

  final UserId? userId;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = userId;
    if (id == null) {
      return const _Section(icon: Icons.people_outline, title: 'Abonnements');
    }

    final following = ref.watch(userFollowingProvider(id));
    // Un rechargement garde la liste dépliée : `value` survit au `loading`.
    final users = following.value ?? const <UserProfile>[];

    return _Section(
      icon: Icons.people_outline,
      title: 'Abonnements',
      trailing: users.isEmpty
          ? _statusIcon(
              context,
              isLoading: following.isLoading,
              hasError: following.hasError,
            )
          : null,
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
    );
  }
}

/// Un onglet. **Sans élément, il n'a pas de flèche et ne s'ouvre pas** : il n'y
/// a rien à déplier, et déplier pour lire « aucun élément » n'apprend rien de
/// plus que la ligne elle-même, en gris.
///
/// [trailing] dit au bout de la ligne ce qui empêche de déplier autre chose
/// qu'un vide : un chargement en cours, un échec.
class _Section extends StatelessWidget {
  const _Section({
    required this.icon,
    required this.title,
    this.trailing,
    this.children = const [],
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final List<Widget> children;

  /// Au-delà, le contenu de l'onglet défile sur place.
  static const _maxHeight = 240.0;

  /// Lignes serrées : trois onglets doivent tenir sans repousser le reste.
  static const _minHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.labelLarge;

    if (children.isEmpty) {
      return ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        minTileHeight: _minHeight,
        leading: Icon(
          icon,
          size: 20,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        title: Text(
          title,
          style: style?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        trailing: trailing,
      );
    }

    return ExpansionTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      minTileHeight: _minHeight,
      // Sans ça, un onglet ouvert se borde de deux liserés.
      shape: const Border(),
      collapsedShape: const Border(),
      childrenPadding: EdgeInsets.zero,
      leading: Icon(icon, size: 20),
      title: Text(title, style: style),
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: _maxHeight),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: children,
          ),
        ),
      ],
    );
  }
}

Widget? _statusIcon(
  BuildContext context, {
  required bool isLoading,
  required bool hasError,
}) {
  if (isLoading) {
    return const SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
  if (hasError) {
    return Tooltip(
      message: 'Indisponible',
      child: Icon(
        Icons.error_outline,
        size: 18,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
  return null;
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
