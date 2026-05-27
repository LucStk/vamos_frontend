import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/shared/shared.dart';
import '../trip_section_label.dart';
import "package:vamos_cartographie/features/media/media.dart";

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

  // static const int _maxDesc = 1000;

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

  @override
  Widget build(BuildContext context) {
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
        DatePicker(
          date: currentTrip.date,
          onDateChanged: (newDate) {
            _patch(currentTrip.copyWith(date: newDate));
          },
        ),

        const SizedBox(height: 20),

        // ── Description ──
        const TripSectionLabel(label: 'DESCRIPTION', icon: Icons.notes),
        const SizedBox(height: 8),
        TextAreaWithCounter(
          initialValue: currentTrip.description,
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
              onChanged: (images) =>
                  setState(() => currentTrip.copyWith(images: images)),
            ),
          ),
        ),
      ],
    );
  }
}
