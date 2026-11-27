import 'dart:math' as math;

// material_ui réexporte package:flutter/widgets.dart, qui ne laisse passer de
// painting que quelques fournisseurs d'images, sans ResizeImage.
import 'package:flutter/painting.dart' show ResizeImage;
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/auth/auth.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/recent_trips_provider.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/favorite_trips_providers.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/follow_providers.dart';
import 'package:vamos_cartographie/map/ui/chrome/account_button.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_scope.dart';
import 'package:vamos_cartographie/map/ui/chrome/panel_sections_provider.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';
import 'package:vamos_cartographie/routing/trip_navigation.dart';

/// Panneau de compte : se déplie depuis le bord gauche, prend toute la hauteur
/// et la plus grande part de la largeur sur téléphone. En haut, le compte
/// (avatar, puis
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
  /// Plafond de largeur : au-delà, un grand écran aurait un panneau démesuré.
  static const _maxWidth = 420.0;

  /// Part de l'écran prise sur téléphone, où le plafond ne tient pas. Le reste
  /// laisse voir la carte, et rappelle que le panneau se referme.
  static const _widthFraction = 0.72;

  static const _duration = Duration(milliseconds: 220);

  /// 0 : replié hors de l'écran, 1 : ouvert. Pris tel quel par le glissement,
  /// pour que le panneau suive le doigt ; les courbes sont demandées à
  /// l'animation, pas au `SlideTransition`.
  late final AnimationController _anim = AnimationController(
    vsync: this,
    duration: _duration,
  );

  BackInterceptors? _back;

  /// Vrai dès que le panneau a fini de se déplier. Un onglet dont l'état retenu
  /// arrive en retard attend ce moment pour s'ouvrir : déplier une liste
  /// pendant le glissement fait sauter l'animation.
  bool _opened = false;

  @override
  void initState() {
    super.initState();
    _anim.addStatusListener(_onAnimStatus);
    _anim.animateTo(1, curve: Curves.easeOutCubic);

    // Après le frame : `set` notifie le `BackScope`, et le registre se cherche
    // dans un arbre déjà monté.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final back = _back = BackScope.interceptorsOf(context);
      back?.set(this, _close);
    });
  }

  void _onAnimStatus(AnimationStatus status) {
    if (_opened || status != AnimationStatus.completed) return;
    setState(() => _opened = true);
  }

  @override
  void dispose() {
    _anim.removeStatusListener(_onAnimStatus);
    final back = _back;
    // Même raison, et l'arbre est verrouillé pendant `dispose`.
    WidgetsBinding.instance.addPostFrameCallback((_) => back?.set(this, null));
    _anim.dispose();
    super.dispose();
  }

  double _panelWidth() =>
      math.min(_maxWidth, MediaQuery.sizeOf(context).width * _widthFraction);

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
                  // Le panneau se peint dans sa propre couche : le glissement
                  // n'est plus qu'un décalage de cette couche, sans repeindre
                  // son contenu à chaque frame.
                  child: RepaintBoundary(
                    child: Material(
                      elevation: 8,
                      child: Row(
                        children: [
                          Expanded(
                            child: SafeArea(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _AccountBox(
                                    onClose: _close,
                                    onSignOut: _signOut,
                                  ),
                                  Expanded(
                                    child: _Sections(
                                      onClose: _close,
                                      opened: _opened,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // La poignée du bord droit : ce qu'on tire pour
                          // refermer. Dans sa propre colonne, pour qu'aucune
                          // ligne ne passe dessous.
                          const _SideHandle(),
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

    return ColoredBox(
      // Une autre couleur que le reste du panneau : l'en-tête se distingue
      // des onglets.
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
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
      ),
    );
  }
}

/// La poignée du bord droit : ce qu'on tire pour refermer le panneau. Le
/// glissement, lui, est capté par tout le panneau.
class _SideHandle extends StatelessWidget {
  const _SideHandle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 14,
      child: Center(
        child: Container(
          width: 4,
          height: 36,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}

/// Les trois onglets. Le panneau entier défile si on les ouvre tous.
class _Sections extends ConsumerWidget {
  const _Sections({required this.onClose, required this.opened});

  final VoidCallback onClose;

  /// Le panneau a fini de se déplier.
  final bool opened;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Null : visiteur. Favoris et abonnements demandent un compte, donc ils
    // n'ont rien à déplier.
    final me = ref.watch(currentUserIdProvider);

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 4),
      children: [
        _RecentSection(onClose: onClose, opened: opened),
        _FavoritesSection(userId: me, onClose: onClose, opened: opened),
        _FollowingSection(userId: me, onClose: onClose, opened: opened),
      ],
    );
  }
}

class _RecentSection extends ConsumerWidget {
  const _RecentSection({required this.onClose, required this.opened});

  final VoidCallback onClose;
  final bool opened;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(recentTripsProvider);

    return _Section(
      id: 'recent',
      icon: Icons.history,
      title: 'Récent',
      opened: opened,
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
  const _FavoritesSection({
    required this.userId,
    required this.onClose,
    required this.opened,
  });

  final UserId? userId;
  final VoidCallback onClose;
  final bool opened;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = userId;
    if (id == null) {
      return _Section(
        id: 'favorites',
        icon: Icons.bookmark_border,
        title: 'Favoris',
        opened: opened,
      );
    }

    final load = ref.watch(loadFavoriteTripsProvider(id));
    final trips = ref.watch(favoriteTripSummariesProvider(id));

    return _Section(
      id: 'favorites',
      icon: Icons.bookmark_border,
      title: 'Favoris',
      opened: opened,
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
  const _FollowingSection({
    required this.userId,
    required this.onClose,
    required this.opened,
  });

  final UserId? userId;
  final VoidCallback onClose;
  final bool opened;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = userId;
    if (id == null) {
      return _Section(
        id: 'following',
        icon: Icons.people_outline,
        title: 'Abonnements',
        opened: opened,
      );
    }

    final following = ref.watch(userFollowingProvider(id));
    // Un rechargement garde la liste dépliée : `value` survit au `loading`.
    final users = following.value ?? const <UserProfile>[];

    return _Section(
      id: 'following',
      icon: Icons.people_outline,
      title: 'Abonnements',
      opened: opened,
      trailing: users.isEmpty
          ? _statusIcon(
              context,
              isLoading: following.isLoading,
              hasError: following.hasError,
            )
          : null,
      children: [
        for (final user in users)
          _UserRow(
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
/// Son contenu vit dans un conteneur un peu plus foncé, décalé vers la droite :
/// on voit d'un coup d'œil ce qui appartient à l'onglet. Ses lignes sont plus
/// petites que le titre, icône comprise.
///
/// Ouvert ou fermé, l'état est retenu d'une fois sur l'autre
/// ([panelSectionsProvider]), et un onglet jamais refermé s'ouvre.
///
/// [trailing] dit au bout de la ligne ce qui empêche de déplier autre chose
/// qu'un vide : un chargement en cours, un échec.
class _Section extends ConsumerStatefulWidget {
  const _Section({
    required this.id,
    required this.icon,
    required this.title,
    required this.opened,
    this.trailing,
    this.children = const [],
  });

  /// Sous quel nom l'ouverture est retenue.
  final String id;

  final IconData icon;
  final String title;

  /// Le panneau a fini de se déplier. Tant que c'est faux, un onglet dont
  /// l'état retenu n'était pas connu au montage reste fermé.
  final bool opened;

  final Widget? trailing;
  final List<Widget> children;

  /// Au-delà, le contenu de l'onglet défile sur place.
  static const _maxHeight = 240.0;

  /// Lignes serrées : trois onglets doivent tenir sans repousser le reste.
  static const _minHeight = 40.0;

  /// La hauteur d'une ligne de contenu, imposée à la liste plutôt que mesurée.
  static const _rowHeight = 34.0;

  @override
  ConsumerState<_Section> createState() => _SectionState();
}

class _SectionState extends ConsumerState<_Section> {
  /// L'ouverture est pilotée par ce contrôleur, et non par un remontage du
  /// tuyau : `initiallyExpanded` ne joue qu'à la première construction.
  final _tile = ExpansibleController();

  /// L'état retenu tel qu'il était au montage. Normalement déjà lu, car
  /// `SearchTopSheet` le demande au disque bien avant le premier tap : le tuyau
  /// se monte alors directement dans le bon état, sans animation. S'il manque
  /// encore, l'onglet se monte fermé et [_openLate] l'ouvrira.
  Map<String, bool>? _initial;

  /// Pour que [_openLate] n'agisse qu'une fois : après, c'est l'utilisateur qui
  /// commande.
  bool _late = false;

  @override
  void initState() {
    super.initState();
    _initial = ref.read(panelSectionsProvider);
  }

  @override
  void dispose() {
    _tile.dispose();
    super.dispose();
  }

  /// Fermé tant que l'état retenu manque : l'ouvrir maintenant obligerait à
  /// le refermer un instant plus tard, en pleine animation du panneau.
  bool get _initiallyExpanded {
    final initial = _initial;
    if (initial == null) return false;
    return initial[widget.id] ?? true;
  }

  /// Ouvre l'onglet que l'état retenu dit ouvert, une fois le panneau déplié.
  void _openLate(Map<String, bool>? sections) {
    if (_late || _initial != null || !widget.opened || sections == null) return;
    _late = true;
    if (sections[widget.id] ?? true) {
      // Hors du build : `expand()` reconstruit le tuyau.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _tile.expand();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.labelLarge;
    // Dans le cas normal l'état retenu est déjà là au montage, et ce `watch`
    // ne déclenche aucune reconstruction : `SearchTopSheet` l'a demandé au
    // disque bien avant le premier tap.
    final sections = ref.watch(panelSectionsProvider);

    if (widget.children.isEmpty) {
      return ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        minTileHeight: _Section._minHeight,
        leading: Icon(
          widget.icon,
          size: 20,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        title: Text(
          widget.title,
          style: style?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        trailing: widget.trailing,
      );
    }

    _openLate(sections);

    return ExpansionTile(
      controller: _tile,
      initiallyExpanded: _initiallyExpanded,
      dense: true,
      visualDensity: VisualDensity.compact,
      minTileHeight: _Section._minHeight,
      // Sans ça, un onglet ouvert se borde de deux liserés.
      shape: const Border(),
      collapsedShape: const Border(),
      onExpansionChanged: (open) => ref
          .read(panelSectionsProvider.notifier)
          .setOpen(widget.id, open: open),
      // Le décalage du conteneur par rapport au titre.
      childrenPadding: const EdgeInsets.only(left: 16, right: 8, bottom: 8),
      leading: Icon(widget.icon, size: 20),
      title: Text(widget.title, style: style),
      children: [
        // Material, et non un simple fond coloré : les ListTile de la liste
        // peignent leur fond et leurs ondes sur le Material le plus proche,
        // qu'un DecoratedBox intercalé masquerait.
        Material(
          color: theme.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            // Hauteur déduite du nombre de lignes, et hauteur de ligne imposée
            // à la liste : celle-ci n'a plus à mesurer ses lignes pour se
            // dimensionner (`shrinkWrap`), donc elle ne monte que les lignes
            // visibles. Ce qui arrive en cours de route — un chargement qui
            // aboutit, une photo de profil qui se décode — ne coûte alors plus
            // une mise en page de toute la liste.
            height: math.min(
              _Section._maxHeight,
              widget.children.length * _Section._rowHeight + 8,
            ),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 4),
              itemExtent: _Section._rowHeight,
              itemCount: widget.children.length,
              itemBuilder: (_, i) => widget.children[i],
            ),
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

/// Un voyage dans un onglet. Icône de 16 et texte en `bodySmall` : plus petit
/// que le titre de l'onglet (20 et `labelLarge`), pour que la hiérarchie se
/// voie.
class _TripRow extends StatelessWidget {
  const _TripRow({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      minTileHeight: 34,
      horizontalTitleGap: 8,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Icon(
        Icons.route_outlined,
        size: 16,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      title: Text(
        title.isEmpty ? 'Voyage sans titre' : title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodySmall,
      ),
      onTap: onTap,
    );
  }
}

/// Un abonnement dans un onglet : même gabarit qu'un voyage, avec la photo du
/// profil en guise d'icône. `UserTile` est fait pour une page, pas pour la
/// largeur d'un panneau.
class _UserRow extends StatelessWidget {
  const _UserRow({required this.user, required this.onTap});

  final UserProfile user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = user.profilePictureUrl;

    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      minTileHeight: 34,
      horizontalTitleGap: 8,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: CircleAvatar(
        radius: 10,
        // Décodée à la taille où elle s'affiche, et non à celle du fichier :
        // une photo de profil pleine résolution décodée pour 20 px coûte une
        // frame, et il y en a une par ligne.
        backgroundImage: imageUrl == null
            ? null
            : ResizeImage(NetworkImage(imageUrl), width: 64),
        child: imageUrl == null
            ? const Icon(Icons.person_outline, size: 12)
            : null,
      ),
      title: Text(
        user.profileName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodySmall,
      ),
      onTap: onTap,
    );
  }
}
