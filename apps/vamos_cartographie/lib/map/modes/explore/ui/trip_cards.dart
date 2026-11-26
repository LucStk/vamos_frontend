import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/image_gallery.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/thumbnail_view.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_discovery_provider.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/trip_favorite_button.dart';
import 'package:vamos_cartographie/domain_features/user_profile/user_profile.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/trip/style/trip_palette.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';

/// Le panneau des voyages de la vue, en bas de l'écran. Un seul axe vertical,
/// trois positions :
///
/// - **bouton** : rien en avant, l'appui sur un tracé entre directement dans
///   le voyage (l'interaction d'avant les cartes) ;
/// - **carrousel** : une carte résumé par voyage, glissée de gauche à droite ;
///   le voyage de la carte affichée est en avant sur la carte ;
/// - **liste** : les mêmes cartes, une par ligne, à faire défiler.
///
/// Tirer vers le haut déplie (bouton → carrousel → liste), vers le bas replie.
///
/// Une carte porte le titre, l'auteur, un aperçu des photos, le nombre de
/// jours, la mobilité principale et les kilomètres, et son contour reprend la
/// couleur du tracé.
@Dependencies([modeSelection, ModeMachine])
class TripCards extends ConsumerWidget {
  const TripCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(tripDiscoveryProvider.select((s) => s.trips));
    if (trips.isEmpty) return const SizedBox.shrink();

    final front = ref.watch(modeSelectionProvider);

    // Rien en avant : le panneau est réduit à son bouton. C'est aussi ce que
    // lit `ExploreMode.onTap` pour savoir qu'un appui doit entrer dans le
    // voyage plutôt que le mettre en avant.
    if (front is! MapTrip) return _CollapsedButton(trips: trips);

    // En avant mais plus dans la vue (caméra déplacée) : pas de carte à
    // montrer, et on ne touche pas à la sélection pour autant.
    final index = trips.indexWhere((t) => t.id == front.id);
    if (index < 0) return const SizedBox.shrink();

    // Le panneau ne vit que tant qu'un voyage est en avant, et il s'ouvre sur
    // sa carte (`initialPage`). Garder un `PageController` entre deux
    // ouvertures ne marcherait pas : il n'est pas encore attaché à l'instant
    // où la sélection arrive, et le carrousel s'ouvrirait sur la première
    // carte.
    return _Panel(initialIndex: index, frontId: front.id);
  }
}

/// Le panneau réduit : de quoi rouvrir le carrousel. Tant qu'il est là, la
/// carte s'utilise normalement (un appui sur un tracé entre dans le voyage).
class _CollapsedButton extends ConsumerWidget {
  const _CollapsedButton({required this.trips});

  final List<VisibleTrip> trips;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: FilledButton.tonalIcon(
          // Le plus pertinent de la vue : le carrousel s'ouvre sur sa carte.
          onPressed: () => ref.applyTransition(
            ExploreMode.selectTrip(MapTrip(trips.first.id)),
          ),
          icon: const Icon(Icons.expand_less),
          label: Text('${trips.length} voyages ici'),
        ),
      ),
    );
  }
}

/// Position du panneau. Le repli complet n'est pas un état d'ici : c'est
/// l'absence de voyage en avant, donc le bouton.
enum _Position { closed, cards, list }

class _Panel extends ConsumerStatefulWidget {
  const _Panel({required this.initialIndex, required this.frontId});

  final int initialIndex;
  final TripId frontId;

  @override
  ConsumerState<_Panel> createState() => _PanelState();
}

class _PanelState extends ConsumerState<_Panel> {
  /// Hauteur du contenu au carrousel : une carte.
  static const _cardsHeight = 196.0;

  /// Hauteur du panneau déplié, en part de l'écran.
  static const _listFraction = 0.75;

  /// La barre de développement, toujours visible : c'est elle qu'on tire, et
  /// elle reste quand le contenu est descendu à ras. 48 : la taille d'un
  /// bouton, pour que le favori ne soit pas rogné.
  static const _barHeight = 48.0;

  /// Une ligne de la liste : une carte. Fixe, pour que la liste s'ouvre pile
  /// sur celle du voyage en avant.
  static const _rowHeight = _cardsHeight;

  static const _snap = Duration(milliseconds: 220);
  static const _slide = Duration(milliseconds: 250);
  static const _flickVelocity = 200.0;

  /// Remplacé à chaque retour au carrousel : le `PageView` a été démonté
  /// pendant que la liste était ouverte, et il doit reprendre sur la carte du
  /// voyage en avant, ce que seul un `initialPage` neuf garantit.
  late PageController _pages = _controller(widget.initialIndex);

  static PageController _controller(int page) =>
      PageController(viewportFraction: 0.9, initialPage: page);

  /// Page affichée. Suivie pour ne pas ramener l'utilisateur de force sur la
  /// carte du voyage en avant quand c'est lui qui vient de glisser.
  late int _page = widget.initialIndex;

  bool _expanded = false;

  /// Hauteur du contenu pendant un glissement : le panneau suit le doigt.
  /// `null` hors glissement, la hauteur est alors celle de la position.
  double? _dragging;

  /// Le glissement a demandé le repli : le contenu s'anime jusqu'à ras, et
  /// c'est en arrivant qu'on repose la sélection (sinon le panneau
  /// disparaîtrait d'un coup, sans se refermer).
  bool _closing = false;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  double _listHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height * _listFraction - _barHeight;

  double _committed(double listHeight) =>
      _expanded ? listHeight : _cardsHeight;

  void _onDragUpdate(DragUpdateDetails d, double listHeight) {
    // Un geste qui reprend pendant le repli repart d'où le panneau en est.
    final from = _dragging ?? (_closing ? 0.0 : _committed(listHeight));
    setState(() {
      _closing = false;
      // Vers le haut (delta négatif), le panneau grandit.
      _dragging = (from - (d.primaryDelta ?? 0)).clamp(0.0, listHeight);
    });
  }

  void _onDragEnd(DragEndDetails d, double listHeight) {
    final flick = d.primaryVelocity ?? 0;
    final height = _dragging ?? _committed(listHeight);

    // Geste franc : la direction décide. Sinon, la position la plus proche.
    final target = switch (flick) {
      < -_flickVelocity => _Position.list,
      > _flickVelocity => _expanded ? _Position.cards : _Position.closed,
      _ => _nearest(height, listHeight),
    };

    if (target == _Position.closed && height <= 0.5) {
      // Déjà à ras : plus rien à animer, donc pas d'`onEnd` à attendre.
      setState(() => _dragging = null);
      _collapse();
      return;
    }

    final fromList = _expanded;
    setState(() {
      _dragging = null;
      _expanded = target == _Position.list;
      _closing = target == _Position.closed;
      // Seulement en revenant de la liste : là, le `PageView` est démonté.
      // Le remplacer tant qu'il est à l'écran casserait son contrôleur.
      if (fromList && target == _Position.cards) _resetPages();
    });
  }

  _Position _nearest(double height, double listHeight) {
    if (height < _cardsHeight / 2) return _Position.closed;
    if (height < (_cardsHeight + listHeight) / 2) return _Position.cards;
    return _Position.list;
  }

  /// Le `PageView` est démonté depuis l'ouverture de la liste : son ancien
  /// contrôleur n'a plus de position à reprendre.
  void _resetPages() {
    _pages.dispose();
    _pages = _controller(_page);
  }

  /// Le panneau a fini de se refermer : on repose la sélection, et le bouton
  /// prend sa place.
  void _collapse() =>
      ref.applyTransition(Transition.set<MapObject>(selectionSlot, null));

  void _onPageChanged(int page, List<VisibleTrip> trips) {
    _page = page;
    // Dernière page (« plus de voyages ») : rien à mettre en avant.
    if (page < trips.length) {
      ref.applyTransition(ExploreMode.selectTrip(MapTrip(trips[page].id)));
    }
  }

  /// Amène la carte du voyage en avant. Quand c'est un glissement qui l'a mis
  /// en avant, la page y est déjà.
  void _follow(int index) {
    if (_page == index) return;
    _page = index;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_pages.hasClients) return;
      _pages.animateToPage(index, duration: _slide, curve: Curves.easeOut);
    });
  }

  void _enter(TripId id) =>
      ref.applyTransition(TripMode.open(id, focus: true));

  /// Une carte choisie dans la liste : son voyage passe en avant et on revient
  /// au carrousel, sur elle.
  void _pick(int index, TripId id) {
    _page = index;
    setState(() {
      _expanded = false;
      _resetPages();
    });
    ref.applyTransition(ExploreMode.selectTrip(MapTrip(id)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final discovery = ref.watch(tripDiscoveryProvider);
    final trips = discovery.trips;

    // La page affichée ne montre plus le voyage en avant : un autre tracé a
    // été touché, ou la liste a changé sous le panneau (caméra déplacée). La
    // dernière page (« plus de voyages ») ne montre aucun voyage : on y laisse
    // l'utilisateur tranquille.
    if (_page < trips.length && trips[_page].id != widget.frontId) {
      final index = trips.indexWhere((t) => t.id == widget.frontId);
      if (index >= 0) _follow(index);
    }

    final listHeight = _listHeight(context);
    final committed = _committed(listHeight);
    final height = _closing ? 0.0 : (_dragging ?? committed);

    return SafeArea(
      child: Material(
        // Semi-transparent : la carte reste lisible derrière le panneau.
        color: theme.colorScheme.surfaceContainerLow.withValues(alpha: 0.88),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DragBar(
              height: _barHeight,
              onDragUpdate: (d) => _onDragUpdate(d, listHeight),
              onDragEnd: (d) => _onDragEnd(d, listHeight),
              trailing: TripFavoriteButton(
                tripId: widget.frontId,
                askVisitorToSignIn: true,
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(end: height),
              // Pendant le glissement, le panneau suit le doigt sans retard ;
              // au relâcher, il rejoint sa position.
              duration: _dragging == null ? _snap : Duration.zero,
              curve: Curves.easeOut,
              onEnd: _closing ? _collapse : null,
              builder: (context, animated, child) =>
                  SizedBox(height: animated, child: child),
              // Le contenu garde la hauteur de sa position et se fait couper :
              // il ne se comprime pas, et la liste garde son défilement.
              child: ClipRect(
                child: OverflowBox(
                  alignment: Alignment.topCenter,
                  minHeight: committed,
                  maxHeight: committed,
                  child: _expanded
                      ? _list(discovery)
                      : _cards(discovery, listHeight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Position carrousel : une carte à la fois, glissée de gauche à droite. Le
  /// glissement vertical, lui, change de position, comme sur la barre.
  Widget _cards(TripDiscoveryState discovery, double listHeight) {
    final trips = discovery.trips;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: (d) => _onDragUpdate(d, listHeight),
      onVerticalDragEnd: (d) => _onDragEnd(d, listHeight),
      child: PageView.builder(
        controller: _pages,
        // Une page de plus : « plus de voyages dans la zone ».
        itemCount: trips.length + 1,
        onPageChanged: (page) => _onPageChanged(page, trips),
        itemBuilder: (context, page) => Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 12),
          child: _card(discovery, page),
        ),
      ),
    );
  }

  /// Position liste : les mêmes cartes, une par ligne, à faire défiler. Elle
  /// s'ouvre sur la carte du voyage en avant.
  Widget _list(TripDiscoveryState discovery) => _CardList(
    rowHeight: _rowHeight,
    initialIndex: _page,
    count: discovery.trips.length + 1,
    cardBuilder: (row) => _card(discovery, row, inList: true),
  );

  /// La carte de la page (ou de la ligne) [at] : un voyage, ou la dernière,
  /// qui en demande plus.
  Widget _card(TripDiscoveryState discovery, int at, {bool inList = false}) {
    final trips = discovery.trips;
    if (at >= trips.length) {
      return _MoreCard(
        loading: discovery.loading,
        canShowMore: discovery.canShowMore,
        onShowMore: ref.read(tripDiscoveryProvider.notifier).showMore,
      );
    }

    final trip = trips[at];
    return _TripCard(
      trip: trip,
      onEnter: () => _enter(trip.id),
      // Dans la liste, appuyer sur une carte met son voyage en avant et
      // referme la liste ; dans le carrousel, la carte affichée est déjà
      // celle du voyage en avant.
      onTap: inList ? () => _pick(at, trip.id) : null,
    );
  }
}

/// La barre de développement : ce qu'on tire pour ouvrir ou refermer le
/// panneau, et où se trouve le bouton favori du voyage en avant.
class _DragBar extends StatelessWidget {
  const _DragBar({
    required this.height,
    required this.onDragUpdate,
    required this.onDragEnd,
    required this.trailing,
  });

  final double height;
  final void Function(DragUpdateDetails) onDragUpdate;
  final void Function(DragEndDetails) onDragEnd;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Opaque : sans ça, seule la poignée de 36 px répondait au glissement,
      // et le panneau ouvert refusait de se refermer.
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: onDragUpdate,
      onVerticalDragEnd: onDragEnd,
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            // Symétrie avec le bouton de droite : la poignée reste centrée.
            const SizedBox(width: 48),
            Expanded(
              child: Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outline,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            SizedBox(width: 48, child: Center(child: trailing)),
          ],
        ),
      ),
    );
  }
}

/// La liste dépliée. Widget à part pour que son `ScrollController` naisse et
/// meure avec elle : créé à chaque construction, il remettrait la liste en
/// haut à chaque image.
class _CardList extends StatefulWidget {
  const _CardList({
    required this.rowHeight,
    required this.initialIndex,
    required this.count,
    required this.cardBuilder,
  });

  final double rowHeight;
  final int initialIndex;
  final int count;
  final Widget Function(int row) cardBuilder;

  @override
  State<_CardList> createState() => _CardListState();
}

class _CardListState extends State<_CardList> {
  static const _slide = Duration(milliseconds: 250);

  late final ScrollController _rows = ScrollController(
    initialScrollOffset: widget.initialIndex * widget.rowHeight,
  );

  @override
  void didUpdateWidget(_CardList old) {
    super.didUpdateWidget(old);
    // Un autre tracé a été touché pendant que la liste est ouverte : on amène
    // sa ligne.
    if (widget.initialIndex != old.initialIndex && _rows.hasClients) {
      _rows.animateTo(
        widget.initialIndex * widget.rowHeight,
        duration: _slide,
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _rows.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _rows,
      padding: EdgeInsets.zero,
      itemExtent: widget.rowHeight,
      itemCount: widget.count,
      itemBuilder: (context, row) => Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: widget.cardBuilder(row),
      ),
    );
  }
}

class _TripCard extends ConsumerWidget {
  const _TripCard({required this.trip, required this.onEnter, this.onTap});

  final VisibleTrip trip;
  final VoidCallback onEnter;

  /// Appui sur la carte elle-même. `null` : la carte n'est pas cliquable (dans
  /// le carrousel, elle montre déjà le voyage en avant).
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final color = tripColor(trip.id);

    // Titre, auteur et photos sont arrivés avec la découverte : ils sont dans
    // les stores, donc rien à charger ici.
    final summary = ref.watch(tripProvider(trip.id));
    final owner = ref.watch(
      profileStoreProvider.select(
        (s) => summary == null ? null : s.profileStore.get(summary.ownerId),
      ),
    );
    final images = ref.watch(tripImagesProvider(trip.id));
    final title = summary?.title ?? '';

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      // Sans fond ni ombre : c'est le panneau, translucide, qu'on voit au
      // travers. Seul le contour marque la carte.
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        // Même couleur que le tracé : c'est ce qui relie la carte au terrain.
        side: BorderSide(color: color, width: 3),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title.isEmpty ? 'Voyage sans titre' : title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium,
                        ),
                        if (owner != null) _Author(owner: owner),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(onPressed: onEnter, child: const Text('Entrer')),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(child: _Images(images: images)),
              const SizedBox(height: 10),
              _Numbers(trip: trip),
            ],
          ),
        ),
      ),
    );
  }
}

/// L'auteur du voyage : sa photo et son nom, d'un seul bloc, qui mène à son
/// profil.
class _Author extends StatelessWidget {
  const _Author({required this.owner});

  final UserProfile owner;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = owner.profilePictureUrl;

    return InkWell(
      onTap: () => UserProfileRoute(owner.id.value).push(context),
      borderRadius: BorderRadius.circular(999),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundImage: imageUrl == null ? null : NetworkImage(imageUrl),
              child: imageUrl == null
                  ? const Icon(Icons.person_outline, size: 12)
                  : null,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                owner.profileName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Aperçu des photos du voyage, en vignettes. Un appui les ouvre en grand,
/// défilables. Sans photo, la place sert à le dire.
class _Images extends StatelessWidget {
  const _Images({required this.images});

  final List<StoredFileFields> images;

  static const _spacing = 6.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shown = [
      for (final image in images)
        if (!image.hasError) image.id,
    ];

    if (shown.isEmpty) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Aucune photo',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxHeight;
        // Le glissement horizontal appartient au carrousel, donc la bande ne
        // défile pas : on n'affiche que ce qui tient, et la dernière vignette
        // compte celles qui restent. Toutes sont dans la visionneuse.
        final fits = ((constraints.maxWidth + _spacing) / (size + _spacing))
            .floor()
            .clamp(1, shown.length);
        final hidden = shown.length - fits;

        return Row(
          children: [
            for (var i = 0; i < fits; i++) ...[
              if (i > 0) const SizedBox(width: _spacing),
              _Thumbnail(
                fileId: shown[i],
                size: size,
                // Le compte sur la dernière vignette visible.
                hidden: i == fits - 1 ? hidden : 0,
                onTap: () =>
                    showImageGallery(context, images: shown, initialIndex: i),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({
    required this.fileId,
    required this.size,
    required this.hidden,
    required this.onTap,
  });

  final StoredFileId fileId;
  final double size;

  /// Photos non affichées, annoncées par-dessus celle-ci. 0 : rien à dire.
  final int hidden;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final thumbnail = ThumbnailView(fileId: fileId, size: size, onTap: onTap);
    if (hidden <= 0) return thumbnail;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          thumbnail,
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ColoredBox(
                color: Colors.black54,
                child: Center(
                  child: Text(
                    '+$hidden',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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

/// Les trois chiffres : jours, mobilité principale, kilomètres.
class _Numbers extends StatelessWidget {
  const _Numbers({required this.trip});

  final VisibleTrip trip;

  @override
  Widget build(BuildContext context) {
    final mobility = trip.mainMobility?.display;

    return Row(
      children: [
        _Number(
          icon: Icons.event_outlined,
          label: '${trip.daysCount} jour${trip.daysCount > 1 ? 's' : ''}',
        ),
        if (mobility != null)
          _Number(icon: mobility.icon, label: mobility.label),
        _Number(icon: Icons.straighten, label: _distance(trip.lengthM)),
      ],
    );
  }

  static String _distance(double meters) {
    if (meters < 1000) return '${meters.round()} m';
    final km = meters / 1000;
    return km < 100
        ? '${km.toStringAsFixed(1).replaceAll('.', ',')} km'
        : '${km.round()} km';
  }
}

class _Number extends StatelessWidget {
  const _Number({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Row(
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(label, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}

/// La carte après la dernière : de quoi en demander plus dans la zone.
class _MoreCard extends StatelessWidget {
  const _MoreCard({
    required this.loading,
    required this.canShowMore,
    required this.onShowMore,
  });

  final bool loading;
  final bool canShowMore;
  final VoidCallback onShowMore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: switch ((loading, canShowMore)) {
            (true, _) => const CircularProgressIndicator(),
            (false, true) => FilledButton.tonalIcon(
              onPressed: onShowMore,
              icon: const Icon(Icons.expand_more),
              label: const Text('Plus de voyages ici'),
            ),
            (false, false) => Text(
              'Tous les voyages de la zone sont là.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          },
        ),
      ),
    );
  }
}
