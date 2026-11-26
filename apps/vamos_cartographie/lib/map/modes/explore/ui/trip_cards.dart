import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/thumbnail_view.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_discovery_provider.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/domain_features/user_profile/user_profile.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/trip/style/trip_palette.dart';

/// Les cartes résumé des voyages de la vue, en bas de l'écran, une par
/// voyage : titre, auteur, aperçu des photos, jours, mobilité principale et
/// kilomètres. Le contour reprend la couleur du tracé sur la carte.
///
/// Elles n'apparaissent qu'une fois un voyage mis en avant (appui sur son
/// tracé). Glisser à droite ou à gauche met en avant le voyage précédent ou
/// suivant ; appuyer sur un autre tracé amène sa carte. La dernière carte
/// demande plus de voyages dans la zone.
@Dependencies([modeSelection, ModeMachine])
class TripCards extends ConsumerStatefulWidget {
  const TripCards({super.key});

  @override
  ConsumerState<TripCards> createState() => _TripCardsState();
}

class _TripCardsState extends ConsumerState<TripCards> {
  static const _height = 196.0;
  static const _slide = Duration(milliseconds: 250);

  final _pages = PageController(viewportFraction: 0.9);

  /// Page affichée. Suivie pour ne pas ramener l'utilisateur de force sur la
  /// carte du voyage en avant quand c'est lui qui vient de glisser.
  int _page = 0;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  void _onPageChanged(int page, List<VisibleTrip> trips) {
    _page = page;
    // Dernière page (« plus de voyages ») : rien à mettre en avant.
    if (page < trips.length) {
      ref.applyTransition(ExploreMode.selectTrip(MapTrip(trips[page].id)));
    }
  }

  /// Le voyage en avant a changé ailleurs (appui sur un tracé) : on amène sa
  /// carte. Quand c'est un glissement qui l'a changé, la page y est déjà.
  void _follow(int index) {
    if (_page == index) return;
    _page = index;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_pages.hasClients) return;
      _pages.animateToPage(index, duration: _slide, curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    final discovery = ref.watch(tripDiscoveryProvider);
    final trips = discovery.trips;
    final front = ref.watch(modeSelectionProvider);

    ref.listen(modeSelectionProvider, (previous, next) {
      if (next is! MapTrip) return;
      final index = trips.indexWhere((t) => t.id == next.id);
      if (index >= 0) _follow(index);
    });

    // Rien en avant : la carte reste nue. Un voyage en avant qui n'est plus
    // dans la vue (caméra déplacée) n'a plus de carte non plus.
    if (front is! MapTrip) return const SizedBox.shrink();
    final index = trips.indexWhere((t) => t.id == front.id);
    if (index < 0) return const SizedBox.shrink();

    return SafeArea(
      child: SizedBox(
        height: _height,
        child: PageView.builder(
          controller: _pages,
          // Une page de plus : « plus de voyages dans la zone ».
          itemCount: trips.length + 1,
          onPageChanged: (page) => _onPageChanged(page, trips),
          itemBuilder: (context, page) => Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 12),
            child: page < trips.length
                ? _TripCard(
                    trip: trips[page],
                    onEnter: () => ref.applyTransition(
                      TripMode.open(trips[page].id, focus: true),
                    ),
                  )
                : _MoreCard(
                    loading: discovery.loading,
                    canShowMore: discovery.canShowMore,
                    onShowMore: ref
                        .read(tripDiscoveryProvider.notifier)
                        .showMore,
                  ),
          ),
        ),
      ),
    );
  }
}

class _TripCard extends ConsumerWidget {
  const _TripCard({required this.trip, required this.onEnter});

  final VisibleTrip trip;
  final VoidCallback onEnter;

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        // Même couleur que le tracé : c'est ce qui relie la carte au terrain.
        side: BorderSide(color: color, width: 3),
      ),
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
                      Text(
                        owner == null ? '' : 'par ${owner.profileName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
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
    );
  }
}

/// Aperçu des photos du voyage : les premières, en vignettes. Sans photo, la
/// place sert à la description.
class _Images extends StatelessWidget {
  const _Images({required this.images});

  final List<StoredFileFields> images;

  static const _max = 6;

  @override
  Widget build(BuildContext context) {
    final shown = [
      for (final image in images)
        if (!image.hasError) image,
    ].take(_max).toList();

    if (shown.isEmpty) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Aucune photo',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) => ListView.separated(
        scrollDirection: Axis.horizontal,
        // Le glissement horizontal appartient au carrousel : la bande de
        // photos ne défile pas d'elle-même.
        physics: const NeverScrollableScrollPhysics(),
        itemCount: shown.length,
        separatorBuilder: (_, _) => const SizedBox(width: 6),
        itemBuilder: (context, i) => ThumbnailView(
          key: ValueKey(shown[i].id),
          fileId: shown[i].id,
          size: constraints.maxHeight,
        ),
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
