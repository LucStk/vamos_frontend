import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';

/// Affiche les informations d'un segment dans un Dialog centré (Card).
///
/// Utilise [SegmentCard.show] pour ouvrir le dialog.
/// En mode [readOnly], affiche uniquement le type actuel sans possibilité
/// de modification ; le bouton "Confirmer" est remplacé par "Fermer".
class SegmentCard extends StatefulWidget {
  final int segmentIndex;
  final Trip trip;
  final void Function(GSegmentTypeEnum) onTypeChanged;
  final bool readOnly;

  const SegmentCard({
    super.key,
    required this.segmentIndex,
    required this.trip,
    required this.onTypeChanged,
    this.readOnly = false,
  });

  /// Ouvre le dialog de sélection du type de segment.
  static void show({
    required BuildContext context,
    required int segmentIndex,
    required Trip trip,
    required void Function(GSegmentTypeEnum) onTypeChanged,
    bool readOnly = false,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => SegmentCard(
        segmentIndex: segmentIndex,
        trip: trip,
        onTypeChanged: onTypeChanged,
        readOnly: readOnly,
      ),
    );
  }

  @override
  State<SegmentCard> createState() => _SegmentCardState();
}

class _SegmentCardState extends State<SegmentCard> {
  late GSegmentTypeEnum _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.trip.segments[widget.segmentIndex].type;
  }

  void _confirm() {
    widget.onTypeChanged(_selectedType);
    Navigator.of(context).pop();
  }

  void _cancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final segmentNumber = widget.segmentIndex + 1;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Titre ──
            Text(
              'Segment $segmentNumber — Type',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // ── Contenu : readOnly ou sélecteur ──
            if (widget.readOnly)
              _ReadOnlyTypeDisplay(type: _selectedType)
            else
              _TypeSelector(
                selectedType: _selectedType,
                onTypeSelected: (type) => setState(() => _selectedType = type),
              ),

            const SizedBox(height: 20),

            // ── Boutons ──
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!widget.readOnly) ...[
                  TextButton(onPressed: _cancel, child: const Text('Annuler')),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: _confirm,
                    child: const Text('Confirmer'),
                  ),
                ] else
                  TextButton(onPressed: _cancel, child: const Text('Fermer')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Widgets internes ──────────────────────────────────────────────────────────

/// Affiche le type actuel avec son icône et son label (mode lecture seule).
class _ReadOnlyTypeDisplay extends StatelessWidget {
  final GSegmentTypeEnum type;

  const _ReadOnlyTypeDisplay({required this.type});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(type.icon, color: type.color, size: 48),
          const SizedBox(height: 8),
          Text(
            type.label,
            style: TextStyle(
              fontSize: 16,
              color: type.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Grille horizontale scrollable pour sélectionner le type de segment.
class _TypeSelector extends StatelessWidget {
  final GSegmentTypeEnum selectedType;
  final void Function(GSegmentTypeEnum) onTypeSelected;

  const _TypeSelector({
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: GSegmentTypeEnum.values.map((type) {
          final selected = selectedType == type;
          return GestureDetector(
            onTap: () => onTypeSelected(type),
            child: Container(
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: selected ? type.color.withOpacity(0.2) : null,
                border: Border.all(
                  color: selected ? type.color : Colors.grey[300]!,
                  width: selected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(type.icon, color: type.color, size: 28),
                  const SizedBox(height: 4),
                  Text(
                    type.label,
                    style: TextStyle(
                      fontSize: 11,
                      color: selected ? type.color : Colors.black87,
                      fontWeight: selected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
