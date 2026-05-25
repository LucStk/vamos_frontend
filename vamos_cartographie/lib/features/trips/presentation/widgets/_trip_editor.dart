import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/shared/widgets/carousel/carousel.dart';
import 'package:vamos_cartographie/shared/widgets/shared/text_area_counter.dart';
import '_trip_section_label.dart';

/// Vue d'édition des informations d'un voyage.
/// Travaille sur une copie locale et n'applique les changements
/// qu'à la confirmation via [onConfirm].
class TripInfoEditor extends StatefulWidget {
  final Trip initialTrip;

  const TripInfoEditor({super.key, required this.initialTrip});

  @override
  State<TripInfoEditor> createState() => TripInfoEditorState();
}

class TripInfoEditorState extends State<TripInfoEditor> {
  late Trip currentTrip;

  static const int _maxDesc = 1000;

  @override
  void initState() {
    super.initState();
    currentTrip = widget.initialTrip;
  }

  void _patch(Trip newTrip) {
    setState(() {
      currentTrip = newTrip;
    });
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: currentTrip.date ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('fr', 'FR'),
    );
    if (picked != null) _patch(currentTrip.copyWith(date: picked));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Titre ──
        TextFormField(
          initialValue: widget.initialTrip.title,
          onChanged: (val) => _patch(currentTrip.copyWith(title: val)),
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            labelText: 'Titre du voyage',
            hintText: 'Ex : Tour de Bretagne 2025',
            prefixIcon: Icon(Icons.title),
            border: OutlineInputBorder(),
          ),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),

        // ── Date ──
        const TripSectionLabel(label: 'DATE', icon: Icons.calendar_today),
        const SizedBox(height: 8),
        Row(
          children: [
            // Bouton date (pas toute la largeur)
            OutlinedButton.icon(
              icon: const Icon(Icons.calendar_today, size: 16),
              label: Text(
                currentTrip.date != null
                    ? DateFormat(
                        'dd MMM yyyy',
                        'fr_FR',
                      ).format(currentTrip.date!)
                    : 'Choisir une date',
                style: TextStyle(
                  color: currentTrip.date != null
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
              onPressed: _pickDate,
            ),
            if (currentTrip.date != null) ...[
              const SizedBox(width: 8),
              IconButton.outlined(
                icon: const Icon(Icons.clear, size: 18),
                tooltip: 'Effacer la date',
                onPressed: () => setState(() => currentTrip.date = null),
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(6),
                  minimumSize: const Size(32, 32),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 20),

        // ── Description ──
        const TripSectionLabel(label: 'DESCRIPTION', icon: Icons.notes),
        const SizedBox(height: 8),
        TextAreaWithCounter(
          initialValue: currentTrip.description ?? '',
          readOnly: false,
          onChanged: (val) => _patch(currentTrip.copyWith(description: val)),
        ),
        const SizedBox(height: 20),

        // ── Photos ──
        const TripSectionLabel(
          label: 'PHOTOS',
          icon: Icons.photo_library_outlined,
        ),
        const SizedBox(height: 8),
        // Le picker est limité en largeur via Align + FractionallySizedBox
        Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: ImageCarouselPicker(
              remoteImages: currentTrip.images,
              readOnly: false,
              onChanged: (images) =>
                  setState(() => currentTrip.images = images),
            ),
          ),
        ),
      ],
    );
  }
}
