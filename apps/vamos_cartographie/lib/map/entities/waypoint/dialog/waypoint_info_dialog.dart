import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_store.dart';
import 'package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stats_list.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/run_stats.dart'
    show lengthBetween;
import 'package:vamos_cartographie/map/entities/waypoint/menus/waypoint_kind_menu.dart';
import 'package:vamos_cartographie/map/entities/waypoint/sheet_pages/overview/waypoint_overview_viewer.dart';
import 'package:vamos_cartographie/map/entities/waypoint/sheet_pages/stats/waypoint_stats.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';
import 'package:vamos_cartographie/map/ui/chrome/dialog/info_dialog.dart';
import 'package:vamos_cartographie/map/ui/chrome/dialog/info_dialog_header.dart';
import 'package:vamos_cartographie/ui_kit/inputs/inline_editable_text.dart';

/// La fiche d'un waypoint, en dialog : même cadre que celles du voyage et du
/// jour ([InfoDialog]), à hauteur partielle pour garder la carte visible.
///
/// En-tête : sa catégorie (modifiable par le propriétaire) et son titre
/// (modifiable en place). Onglets : aperçu (photos, description, fin d'étape)
/// et détails.
class WaypointInfoDialog extends ConsumerWidget {
  const WaypointInfoDialog({super.key, required this.mode, required this.id});

  final TripReadyMode mode;
  final WaypointId id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final tripId = mode.tripId;
    final editable = !mode.readOnly;
    final waypoint = ref.watch(waypointProvider(tripId, id));
    final style = waypoint.display;
    final geometry = ref.watch(
      routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
    );
    final distanceFromStart = geometry == null || geometry.length < 2
        ? null
        : lengthBetween(geometry, 0, waypoint.anchorPosition);

    final day = _dayOf(waypoint, ref.watch(routeDaysProvider(tripId)));

    final subtitle = [
      if (waypoint.stay != null) 'Halte',
      if (waypoint.kind != null) waypoint.kind.display.label,
    ].join(' · ');

    return InfoDialog(
      key: kSelectionDialogKey,
      bottomInset: TripReadyDock.clearance,
      heightFactor: kPartialDialogHeightFactor,
      contentKey: id,
      header: InfoDialogHeader(
        // Remonte à la journée du waypoint, comme le fait un morceau.
        onBack: day == null
            ? null
            : () => ref.applyTransition(
                Transition.set<MapObject>(
                  selectionSlot,
                  MapDaySegment(tripId: tripId, endsAt: day.endsAt),
                ),
              ),
        backTooltip: 'Retour à la journée',
        // Le propriétaire change la catégorie d'ici ; les autres la voient.
        leading: editable
            ? WaypointKindMenu(
                selected: waypoint.kind,
                buttonSize: 32,
                onChanged: (kind) => ref
                    .read(waypointStoreProvider(tripId).notifier)
                    .updateKind(waypoint, kind),
              )
            : CircleAvatar(
                radius: 16,
                backgroundColor: style.color,
                child: Icon(style.icon, size: 18, color: Colors.white),
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InlineEditableText(
              text: waypoint.title,
              placeholder: style.label,
              canEdit: editable,
              onSave: (title) async {
                ref
                    .read(waypointStoreProvider(tripId).notifier)
                    .updateTitle(waypoint, title);
                return null;
              },
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ),
      pages: [
        InfoDialogPage(
          label: 'Aperçu',
          icon: Icons.photo_library_outlined,
          selectedIcon: Icons.photo_library,
          child: WaypointOverviewViewer(
            tripId: tripId,
            waypoint: waypoint,
            editable: editable,
          ),
        ),
        InfoDialogPage(
          label: 'Détails',
          icon: Icons.info_outline,
          selectedIcon: Icons.info,
          child: StatsList(
            stats: waypointStatsOf(
              waypoint,
              distanceFromStartM: distanceFromStart,
            ),
          ),
        ),
      ],
    );
  }
}

/// La journée d'un waypoint : celle que sa halte termine, sinon la première
/// qui le contient. Null si la route n'a pas (encore) de journée pour lui.
RouteDay? _dayOf(WaypointFields waypoint, List<RouteDay> days) {
  if (waypoint.stay != null) {
    final ending = days.where((d) => d.endsAt == waypoint.id).firstOrNull;
    if (ending != null) return ending;
  }
  const eps = 1e-6;
  final a = waypoint.anchorPosition;
  return days
      .where((d) => d.hasGeometry && a >= d.from - eps && a <= d.to + eps)
      .firstOrNull;
}
