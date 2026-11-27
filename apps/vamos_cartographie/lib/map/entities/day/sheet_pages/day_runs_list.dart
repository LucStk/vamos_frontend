import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/injection/run_note_providers.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/run_stats.dart';

/// Le parcours d'un jour en une ligne horizontale, fine, faite pour être
/// fixée en bas du dialog du jour.
///
/// Un segment par morceau (un par span de mobilité traversé), dans la couleur
/// de sa mobilité, avec son symbole dedans et sa distance dessous ; sa
/// longueur est proportionnelle à la part du jour qu'il représente. Les
/// waypoints du jour sont posés au-dessus, à leur place sur la ligne, avec
/// l'icône de leur catégorie. Toucher un segment ouvre la fiche du morceau,
/// toucher un waypoint ouvre la sienne.
class DayRunsList extends ConsumerWidget {
  const DayRunsList({super.key, required this.tripId, required this.endsAt});

  final TripId tripId;
  final WaypointId? endsAt;

  /// Largeur plancher d'un morceau : de quoi y lire son symbole et sa
  /// distance, même s'il ne pèse presque rien dans la journée.
  static const _minSegmentWidth = 56.0;

  /// Marge de chaque côté : un waypoint posé au départ ou à l'arrivée du jour
  /// déborde de la ligne d'un demi-marqueur.
  static const _sidePadding = 16.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runs = ref.watch(dayRunsProvider(tripId, endsAt))?.runs ?? const [];

    final segments = <_Segment>[];
    for (final run in runs) {
      final key = (tripId: tripId, endsAt: endsAt, spanId: run.mobilityId);
      final stats = watchRunStats(ref, key);
      if (stats != null) segments.add(_Segment(key, run.range, stats));
    }
    if (segments.isEmpty) return const SizedBox.shrink();

    final day = ref.watch(routeDayProvider(tripId, endsAt));
    final geometry = ref.watch(
      routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
    );
    // Les waypoints posés sur ce jour, extrémités comprises (la halte de la
    // veille et celle du soir).
    final waypoints = <WaypointFields>[
      if (day != null && geometry != null)
        for (final id in ref.watch(allWaypointIdsProvider(tripId)))
          if (_within(ref.watch(waypointProvider(tripId, id)), day))
            ref.watch(waypointProvider(tripId, id)),
    ];

    final total = segments.fold(0.0, (sum, s) => sum + s.stats.distanceM);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Largeur proportionnelle, avec un plancher ; si la somme déborde
        // (beaucoup de petits morceaux), la ligne défile.
        final available = constraints.maxWidth - 2 * _sidePadding;
        final widths = <double>[
          for (final s in segments)
            max(
              _minSegmentWidth,
              total > 0
                  ? available * s.stats.distanceM / total
                  : available / segments.length,
            ),
        ];
        final stripWidth = widths.fold(0.0, (a, b) => a + b);

        // Abscisse de chaque waypoint : dans son morceau, au prorata de
        // la distance parcourue depuis le début de celui-ci.
        final markers = <_Marker>[];
        if (geometry != null) {
          var left = 0.0;
          for (final (i, s) in segments.indexed) {
            final range = s.range;
            final length = lengthBetween(geometry, range.from, range.to);
            for (final w in waypoints) {
              final a = w.anchorPosition;
              if (!_inRange(a, range.from, range.to)) continue;
              // Posé à la frontière de deux morceaux : le premier le garde.
              if (markers.any((m) => m.waypoint.id == w.id)) continue;
              final fraction = length > 0
                  ? lengthBetween(geometry, range.from, a) / length
                  : 0.0;
              markers.add(
                _Marker(w, left + fraction.clamp(0.0, 1.0) * widths[i]),
              );
            }
            left += widths[i];
          }
        }

        final content = SizedBox(
          width: stripWidth + 2 * _sidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (markers.isNotEmpty)
                SizedBox(
                  height: _WaypointMarker.height,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      for (final m in markers)
                        Positioned(
                          left:
                              _sidePadding + m.x - _WaypointMarker.diameter / 2,
                          top: 0,
                          child: _WaypointMarker(
                            waypoint: m.waypoint,
                            tripId: tripId,
                          ),
                        ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: _sidePadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final (i, s) in segments.indexed)
                      SizedBox(
                        width: widths[i],
                        child: _SegmentView(segment: s),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
        return stripWidth > available
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: content,
              )
            : content;
      },
    );
  }

  static const _eps = 1e-6;

  static bool _inRange(double a, double from, double to) =>
      a >= from - _eps && a <= to + _eps;

  static bool _within(WaypointFields w, RouteDay day) =>
      _inRange(w.anchorPosition, day.from, day.to);
}

class _Segment {
  const _Segment(this.key, this.range, this.stats);

  final RunKey key;
  final RouteRange range;
  final RunStats stats;
}

class _Marker {
  const _Marker(this.waypoint, this.x);

  final WaypointFields waypoint;

  /// Abscisse du centre, depuis le début de la ligne.
  final double x;
}

/// Un waypoint sur la ligne : un rond à l'icône de sa catégorie, relié à la
/// ligne par un petit trait.
class _WaypointMarker extends ConsumerWidget {
  const _WaypointMarker({required this.waypoint, required this.tripId});

  static const diameter = 28.0;
  static const _tick = 5.0;
  static const height = diameter + _tick;

  final WaypointFields waypoint;
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = waypoint.display;
    final title = waypoint.title.trim();

    return Tooltip(
      message: title.isEmpty ? style.label : '$title · ${style.label}',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => ref.applyTransition(
          Transition.set<MapObject>(
            selectionSlot,
            MapWaypoint(id: waypoint.id, tripId: tripId),
          ),
        ),
        child: SizedBox(
          width: diameter,
          height: height,
          child: Column(
            children: [
              Container(
                width: diameter,
                height: diameter,
                decoration: BoxDecoration(
                  color: style.color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                    width: 2,
                  ),
                ),
                child: Icon(style.icon, color: Colors.white, size: 15),
              ),
              Container(width: 2, height: _tick, color: style.color),
            ],
          ),
        ),
      ),
    );
  }
}

class _SegmentView extends ConsumerWidget {
  const _SegmentView({required this.segment});

  final _Segment segment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final key = segment.key;
    final style = segment.stats.mobility.display;
    final title = ref.watch(runNoteProvider(key))?.title.trim() ?? '';

    return Tooltip(
      message: title.isEmpty ? style.label : '$title · ${style.label}',
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => ref.applyTransition(
          Transition.set<MapObject>(
            selectionSlot,
            MapDayRun(
              tripId: key.tripId,
              endsAt: key.endsAt,
              spanId: key.spanId,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
          child: Column(
            children: [
              // La ligne : la couleur de la mobilité, son symbole dedans.
              Container(
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: style.color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(style.icon, color: Colors.white, size: 14),
              ),
              const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  formatDistance(segment.stats.distanceM),
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
