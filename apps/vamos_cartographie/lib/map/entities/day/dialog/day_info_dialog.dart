import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/injection/run_note_providers.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_store.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/day/dialog/day_stats.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/day_runs_list.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/run_stats.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';
import 'package:vamos_cartographie/map/ui/chrome/dialog/info_dialog.dart';
import 'package:vamos_cartographie/map/ui/chrome/dialog/info_dialog_header.dart';
import 'package:vamos_cartographie/ui_kit/inputs/inline_editable_text.dart';

/// La fiche d'un jour, en dialog, ou celle d'un de ses morceaux quand
/// [spanId] est donné. Même cadre que la fiche du voyage ([InfoDialog]) ; un
/// seul widget pour les deux, afin que passer du jour à son morceau ne
/// referme ni ne rouvre le dialog.
///
/// [endsAt] : la halte qui termine la journée ; null pour la dernière.
class DayInfoDialog extends ConsumerStatefulWidget {
  const DayInfoDialog({
    super.key,
    required this.mode,
    required this.endsAt,
    this.spanId,
  });

  final TripReadyMode mode;
  final WaypointId? endsAt;
  final SpanId? spanId;

  @override
  ConsumerState<DayInfoDialog> createState() => _DayInfoDialogState();
}

class _DayInfoDialogState extends ConsumerState<DayInfoDialog> {
  TripId get _tripId => widget.mode.tripId;
  bool get _editable => !widget.mode.readOnly;

  @override
  void initState() {
    super.initState();
    _loadFinalNote();
  }

  @override
  void didUpdateWidget(DayInfoDialog old) {
    super.didUpdateWidget(old);
    if (old.endsAt != widget.endsAt) _loadFinalNote();
  }

  /// La note de la dernière journée n'est pas chargée avec les waypoints.
  void _loadFinalNote() {
    if (widget.endsAt != null) return;
    // Après le build : charger modifie un provider.
    Future.microtask(() {
      if (!mounted) return;
      ref.read(waypointStoreProvider(_tripId).notifier).loadFinalDayNote();
    });
  }

  @override
  Widget build(BuildContext context) {
    final spanId = widget.spanId;
    return spanId == null ? _buildDay() : _buildRun(spanId);
  }

  // -------------------------------------------------------------- Jour

  DayNote? _watchNote() => widget.endsAt == null
      ? ref.watch(waypointStoreProvider(_tripId).select((s) => s.finalDayNote))
      : ref.watch(
          waypointProvider(
            _tripId,
            widget.endsAt!,
          ).select((w) => w.stay?.noteAt(0)),
        );

  /// Titre et notes se modifient séparément mais s'enregistrent ensemble :
  /// l'autre champ garde sa valeur actuelle.
  Future<Failure?> _saveDayNote({String? title, String? notes}) async {
    final current = widget.endsAt == null
        ? ref.read(waypointStoreProvider(_tripId)).finalDayNote
        : ref.read(waypointProvider(_tripId, widget.endsAt!)).stay?.noteAt(0);
    final editor = ref.read(waypointStoreProvider(_tripId).notifier);
    final newTitle = title ?? current?.title ?? '';
    final newNotes = notes ?? current?.notes ?? '';
    final result = widget.endsAt == null
        ? await editor.setFinalDayNote(title: newTitle, notes: newNotes)
        : await editor.setStayDayNote(
            widget.endsAt!,
            0,
            title: newTitle,
            notes: newNotes,
          );
    return result.fold<Failure?>((failure) => failure, (_) => null);
  }

  Widget _buildDay() {
    final number = ref.watch(
      routeDayProvider(_tripId, widget.endsAt).select((d) => d?.number),
    );
    final dayLabel = number == null ? 'Journée' : 'Jour $number';
    final note = _watchNote();
    final title = note?.title.trim() ?? '';
    final notes = note?.notes.trim() ?? '';
    final hasRuns =
        ref.watch(dayRunsProvider(_tripId, widget.endsAt))?.runs.isNotEmpty ??
        false;
    final theme = Theme.of(context);

    return InfoDialog(
      key: kSelectionDialogKey,
      bottomInset: TripReadyDock.clearance,
      heightFactor: kPartialDialogHeightFactor,
      contentKey: (widget.endsAt, null),
      // Le parcours du jour (morceaux et waypoints), toujours sous les yeux ;
      // il se consulte aussi en lecture seule.
      footer: hasRuns
          ? DayRunsList(tripId: _tripId, endsAt: widget.endsAt)
          : null,
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InlineEditableText(
            text: title,
            placeholder: dayLabel,
            canEdit: _editable,
            onSave: (value) => _saveDayNote(title: value),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (title.isNotEmpty)
            Text(
              dayLabel,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
      pages: [
        InfoDialogPage(
          label: 'Aperçu',
          icon: Icons.event_note_outlined,
          selectedIcon: Icons.event_note,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SectionTitle('Notes'),
              const SizedBox(height: 8),
              _NotesField(
                text: notes,
                editable: _editable,
                emptyHint: 'Aucune note',
                placeholder: 'Ajoutez des notes sur cette journée…',
                onSave: (value) => _saveDayNote(notes: value),
              ),
            ],
          ),
        ),
        InfoDialogPage(
          label: 'Statistiques',
          icon: Icons.bar_chart_outlined,
          selectedIcon: Icons.bar_chart,
          child: DayStatsView(tripId: _tripId, endsAt: widget.endsAt),
        ),
      ],
    );
  }

  // ----------------------------------------------------------- Morceau

  Widget _buildRun(SpanId spanId) {
    final key = (tripId: _tripId, endsAt: widget.endsAt, spanId: spanId);
    final stats = watchRunStats(ref, key);
    final note = ref.watch(runNoteProvider(key));
    final number = ref.watch(
      routeDayProvider(_tripId, widget.endsAt).select((d) => d?.number),
    );
    final style = stats?.mobility.display;
    final title = note?.title.trim() ?? '';
    final notes = note?.notes.trim() ?? '';
    final theme = Theme.of(context);

    Future<Failure?> save({String? newTitle, String? newNotes}) async {
      final result = await saveRunNote(
        ref,
        key,
        title: newTitle ?? title,
        notes: newNotes ?? notes,
      );
      return result.fold<Failure?>((failure) => failure, (_) => null);
    }

    return InfoDialog(
      key: kSelectionDialogKey,
      bottomInset: TripReadyDock.clearance,
      heightFactor: kPartialDialogHeightFactor,
      contentKey: (widget.endsAt, spanId),
      header: InfoDialogHeader(
        // Le retour au jour est le bouton en bas à gauche du dock.
        leading: style == null
            ? null
            : Icon(style.icon, color: style.color, size: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InlineEditableText(
              text: title,
              placeholder: style?.label ?? 'Morceau',
              canEdit: _editable && stats != null,
              onSave: (value) => save(newTitle: value),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              [
                if (number != null) 'Jour $number',
                if (title.isNotEmpty && style != null) style.label,
                if (stats != null) formatDistance(stats.distanceM),
              ].join(' · '),
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      pages: [
        InfoDialogPage(
          label: 'Morceau',
          icon: Icons.route_outlined,
          selectedIcon: Icons.route,
          child: stats == null
              ? Text(
                  'Ce morceau n’existe plus : la route a changé.',
                  style: theme.textTheme.bodyMedium,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _SectionTitle('Notes'),
                    const SizedBox(height: 8),
                    _NotesField(
                      text: notes,
                      editable: _editable,
                      emptyHint: 'Aucune note',
                      placeholder: 'Ajoutez des notes sur ce morceau…',
                      onSave: (value) => save(newNotes: value),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}

/// Les notes : modifiables en place pour le propriétaire, sinon un texte (ou
/// une mention discrète s'il n'y en a pas).
class _NotesField extends StatelessWidget {
  const _NotesField({
    required this.text,
    required this.editable,
    required this.emptyHint,
    required this.placeholder,
    required this.onSave,
  });

  final String text;
  final bool editable;
  final String emptyHint;
  final String placeholder;
  final Future<Failure?> Function(String value) onSave;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 14, height: 1.5);
    if (editable) {
      return InlineEditableText(
        text: text,
        canEdit: true,
        multiline: true,
        expand: true,
        maxLength: 1000,
        placeholder: placeholder,
        style: style,
        onSave: onSave,
      );
    }
    if (text.isNotEmpty) return Text(text, style: style);
    final theme = Theme.of(context);
    return Text(
      emptyHint,
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      label,
      style: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
