import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/injection/run_note_providers.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/run_stats.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';

/// Fiche d'un morceau de journée : la partie du jour [endsAt] parcourue dans
/// le span [spanId]. Ses chiffres (distance, mobilité), puis son titre et ses
/// notes.
///
/// [endsAt] : la halte qui termine la journée ; null pour la dernière.
List<SheetPage> runSheetPages(
  TripId tripId,
  WaypointId? endsAt,
  SpanId spanId, {
  bool editable = false,
}) {
  final key = (tripId: tripId, endsAt: endsAt, spanId: spanId);
  return [
    SheetPage(
      label: 'Morceau',
      icon: Icons.route_outlined,
      selectedIcon: Icons.route,
      compact: SheetCompact(child: _RunCompact(runKey: key)),
      expanded: _RunForm(
        key: ValueKey(key),
        runKey: key,
        editable: editable,
      ),
    ),
  ];
}

class _RunCompact extends ConsumerWidget {
  const _RunCompact({required this.runKey});

  final RunKey runKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final stats = watchRunStats(ref, runKey);
    final number = ref.watch(
      routeDayProvider(
        runKey.tripId,
        runKey.endsAt,
      ).select((d) => d?.number),
    );
    final note = ref.watch(runNoteProvider(runKey));
    final style = stats?.mobility.display;
    final title = note?.title.trim() ?? '';
    final notes = note?.notes.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (style != null) ...[
              Icon(style.icon, color: style.color, size: 20),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                title.isNotEmpty ? title : (style?.label ?? 'Morceau'),
                style: theme.textTheme.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SheetExpandButton(),
          ],
        ),
        Text(
          [
            if (number != null) 'Jour $number',
            if (stats != null) formatDistance(stats.distanceM),
          ].join(' · '),
          style: theme.textTheme.labelSmall,
        ),
        const SizedBox(height: 4),
        Expanded(
          child: Text(
            notes.isEmpty ? 'Aucune note' : notes,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _RunForm extends ConsumerStatefulWidget {
  const _RunForm({super.key, required this.runKey, required this.editable});

  final RunKey runKey;
  final bool editable;

  @override
  ConsumerState<_RunForm> createState() => _RunFormState();
}

class _RunFormState extends ConsumerState<_RunForm> {
  late final TextEditingController _title;
  late final TextEditingController _notes;

  /// Vrai dès que l'utilisateur a touché au texte : un rechargement des notes
  /// ne l'écrase plus.
  bool _dirty = false;

  @override
  void initState() {
    super.initState();
    final note = ref.read(runNoteProvider(widget.runKey));
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
    final result = await saveRunNote(
      ref,
      widget.runKey,
      title: _title.text,
      notes: _notes.text,
    );
    if (!mounted) return;
    result.fold(
      (failure) => ScaffoldMessenger.maybeOf(
        context,
      )?.showSnackBar(SnackBar(content: Text(failure.message))),
      (_) => _dirty = false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Les notes arrivent du serveur après l'ouverture de la fiche.
    ref.listen(runNoteProvider(widget.runKey), (_, note) {
      if (_dirty) return;
      _title.text = note?.title ?? '';
      _notes.text = note?.notes ?? '';
    });

    final stats = watchRunStats(ref, widget.runKey);
    final theme = Theme.of(context);
    final style = stats?.mobility.display;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (stats == null)
          Text(
            'Ce morceau n’existe plus : la route a changé.',
            style: theme.textTheme.bodyMedium,
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: Icon(style!.icon, color: style.color, size: 18),
                label: Text(style.label),
              ),
              Chip(
                avatar: const Icon(Icons.straighten, size: 18),
                label: Text(formatDistance(stats.distanceM)),
              ),
              // Pas d'altitudes sur la route pour l'instant.
              const Chip(
                avatar: Icon(Icons.terrain, size: 18),
                label: Text('Dénivelé : bientôt'),
              ),
            ],
          ),
        const SizedBox(height: 12),
        TextField(
          controller: _title,
          readOnly: !widget.editable,
          onChanged: (_) => _dirty = true,
          decoration: const InputDecoration(
            labelText: 'Titre',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _notes,
          readOnly: !widget.editable,
          onChanged: (_) => _dirty = true,
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
              onPressed: stats == null ? null : _save,
              child: const Text('Enregistrer'),
            ),
          ),
        ],
      ],
    );
  }
}
