import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/features/carousel/carousel.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'package:vamos_cartographie/features/trips/widgets/trip_section_label.dart';

class TripFormDialog extends ConsumerStatefulWidget {
  final Trip initialTrip;
  final Future<void> Function(WidgetRef ref, Trip trip) onSubmit;
  final String successMessage;

  const TripFormDialog({
    super.key,
    required this.initialTrip,
    required this.onSubmit,
    required this.successMessage,
  });

  @override
  ConsumerState<TripFormDialog> createState() => _TripFormDialogState();
}

class _TripFormDialogState extends ConsumerState<TripFormDialog> {
  // L'état local du formulaire vit ici désormais
  late Trip _currentTrip;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _currentTrip = widget.initialTrip;
  }

  void _patch(Trip newTrip) {
    setState(() {
      _currentTrip = newTrip;
    });
  }

  Future<void> _submit() async {
    setState(() {
      _isSaving = true;
    });

    try {
      // On passe directement le _currentTrip local sans passer par une Key !
      await widget.onSubmit(ref, _currentTrip);
      if (!mounted) return;
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      // Optionnel : gérer l'affichage de l'erreur ici
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DialogShell(
      constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

      // 1. Le contenu (Formulaire)
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            initialValue: widget.initialTrip.title,
            onChanged: (val) => _patch(_currentTrip.copyWith(title: val)),
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

          const TripSectionLabel(label: 'DATE', icon: Icons.calendar_today),
          const SizedBox(height: 8),
          DatePicker(
            date: _currentTrip.date,
            onDateChanged: (newDate) =>
                _patch(_currentTrip.copyWith(date: newDate)),
          ),
          const SizedBox(height: 20),

          const TripSectionLabel(label: 'DESCRIPTION', icon: Icons.notes),
          const SizedBox(height: 8),
          TextAreaWithCounter(
            initialValue: _currentTrip.description,
            readOnly: false,
            onChanged: (val) => _patch(_currentTrip.copyWith(description: val)),
          ),
          const SizedBox(height: 20),

          const TripSectionLabel(
            label: 'PHOTOS',
            icon: Icons.photo_library_outlined,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: ImageCarouselPicker(id: widget.initialTrip.id),
            ),
          ),
        ],
      ),

      // 2. Les boutons construits en profitant des variables du State local
      buttonsBuilder: (ctx) => [
        CancelButton(onPressed: () => Navigator.of(ctx).pop()),
        const Spacer(),
        ConfirmButton(
          isLoading: _isSaving,
          onPressed: _submit, // Appelle la fonction locale directement
        ),
      ],
    );
  }
}
