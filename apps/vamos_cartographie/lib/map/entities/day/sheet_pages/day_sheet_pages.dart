import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_store.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';

/// Page d'une journée de la route : titre et notes.
///
/// [endsAt] : la halte qui termine la journée ; null pour la dernière.
List<SheetPage> daySheetPages(
  TripId tripId,
  WaypointId? endsAt, {
  bool editable = false,
}) => [
  SheetPage(
    label: 'Journée',
    icon: Icons.event_note_outlined,
    selectedIcon: Icons.event_note,
    compact: SheetCompact(child: _DayCompact(tripId: tripId, endsAt: endsAt)),
    expanded: _DayNotesForm(
      key: ValueKey((tripId, endsAt)),
      tripId: tripId,
      endsAt: endsAt,
      editable: editable,
    ),
  ),
];

/// Notes du jour qui arrive à la halte [endsAt] (offset 0), ou de la dernière
/// journée quand [endsAt] est null.
DayNote? _watchNote(WidgetRef ref, TripId tripId, WaypointId? endsAt) =>
    endsAt == null
    ? ref.watch(waypointStoreProvider(tripId).select((s) => s.finalDayNote))
    : ref.watch(
        waypointProvider(tripId, endsAt).select((w) => w.stay?.noteAt(0)),
      );

class _DayCompact extends ConsumerStatefulWidget {
  const _DayCompact({required this.tripId, required this.endsAt});

  final TripId tripId;
  final WaypointId? endsAt;

  @override
  ConsumerState<_DayCompact> createState() => _DayCompactState();
}

class _DayCompactState extends ConsumerState<_DayCompact> {
  @override
  void initState() {
    super.initState();
    // La note de la dernière journée n'est pas chargée avec les waypoints.
    if (widget.endsAt == null) {
      ref
          .read(waypointStoreProvider(widget.tripId).notifier)
          .loadFinalDayNote();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final number = ref.watch(
      routeDayProvider(
        widget.tripId,
        widget.endsAt,
      ).select((d) => d?.number),
    );
    final note = _watchNote(ref, widget.tripId, widget.endsAt);
    final title = note?.title.trim() ?? '';
    final notes = note?.notes.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title.isNotEmpty
                    ? title
                    : (number == null ? 'Journée' : 'Jour $number'),
                style: theme.textTheme.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SheetExpandButton(),
          ],
        ),
        if (title.isNotEmpty && number != null)
          Text('Jour $number', style: theme.textTheme.labelSmall),
        const SizedBox(height: 4),
        Expanded(
          child: Text(
            notes.isEmpty ? 'Aucune note' : notes,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _DayNotesForm extends ConsumerStatefulWidget {
  const _DayNotesForm({
    super.key,
    required this.tripId,
    required this.endsAt,
    required this.editable,
  });

  final TripId tripId;
  final WaypointId? endsAt;
  final bool editable;

  @override
  ConsumerState<_DayNotesForm> createState() => _DayNotesFormState();
}

class _DayNotesFormState extends ConsumerState<_DayNotesForm> {
  late final TextEditingController _title;
  late final TextEditingController _notes;

  @override
  void initState() {
    super.initState();
    final endsAt = widget.endsAt;
    final note = endsAt == null
        ? ref.read(waypointStoreProvider(widget.tripId)).finalDayNote
        : ref.read(waypointProvider(widget.tripId, endsAt)).stay?.noteAt(0);
    _title = TextEditingController(text: note?.title ?? '');
    _notes = TextEditingController(text: note?.notes ?? '');
  }

  @override
  void dispose() {
    _title.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final editor = ref.read(waypointStoreProvider(widget.tripId).notifier);
    final endsAt = widget.endsAt;
    final result = endsAt == null
        ? await editor.setFinalDayNote(title: _title.text, notes: _notes.text)
        : await editor.setStayDayNote(
            endsAt,
            0,
            title: _title.text,
            notes: _notes.text,
          );
    if (!mounted) return;
    result.fold(
      (failure) => ScaffoldMessenger.maybeOf(
        context,
      )?.showSnackBar(SnackBar(content: Text(failure.message))),
      (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _title,
          readOnly: !widget.editable,
          decoration: const InputDecoration(
            labelText: 'Titre',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _notes,
          readOnly: !widget.editable,
          minLines: 4,
          maxLines: null,
          decoration: const InputDecoration(
            labelText: 'Notes',
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
          ),
        ),
        if (widget.editable) ...[
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: _save,
              child: const Text('Enregistrer'),
            ),
          ),
        ],
      ],
    );
  }
}
