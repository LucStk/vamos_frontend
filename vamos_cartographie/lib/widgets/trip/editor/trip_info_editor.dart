import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vamos_cartographie/models.dart';
import 'package:vamos_cartographie/widgets/image_carousel_picker.dart';
import '../_trip_section_label.dart';

/// Vue d'édition des informations d'un voyage.
/// Travaille sur une copie locale et n'applique les changements
/// qu'à la confirmation via [onConfirm].
class TripInfoEditor extends StatefulWidget {
  final Trip trip;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmLabel;
  final IconData confirmIcon;

  const TripInfoEditor({
    super.key,
    required this.trip,
    required this.onConfirm,
    required this.onCancel,
    this.confirmLabel = 'Confirmer',
    this.confirmIcon = Icons.check,
  });

  @override
  State<TripInfoEditor> createState() => _TripInfoEditorState();
}

class _TripInfoEditorState extends State<TripInfoEditor> {
  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;
  late DateTime? _date;
  late List<String> _imagePaths;
  late List<String> _imageUrls;

  static const int _maxDesc = 1000;

  @override
  void initState() {
    super.initState();
    // On travaille sur les valeurs actuelles du trip (pas de copie profonde nécessaire
    // car on écrit directement sur le trip à la confirmation)
    _titleCtrl = TextEditingController(text: widget.trip.title);
    _descCtrl = TextEditingController(text: widget.trip.description);
    _date = widget.trip.date;
    _imagePaths = List<String>.from(widget.trip.imagePaths);
    _imageUrls = List<String>.from(widget.trip.imageUrls);
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('fr', 'FR'),
    );
    if (picked != null) setState(() => _date = picked);
  }

  void _confirm() {
    widget.trip.title = _titleCtrl.text.trim();
    widget.trip.description = _descCtrl.text;
    widget.trip.date = _date;
    widget.trip.imagePaths = _imagePaths;
    widget.trip.imageUrls = _imageUrls;
    widget.onConfirm();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Titre ──
        TextField(
          controller: _titleCtrl,
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
                _date != null
                    ? DateFormat('dd MMM yyyy', 'fr_FR').format(_date!)
                    : 'Choisir une date',
                style: TextStyle(
                  color: _date != null
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
              onPressed: _pickDate,
            ),
            if (_date != null) ...[
              const SizedBox(width: 8),
              IconButton.outlined(
                icon: const Icon(Icons.clear, size: 18),
                tooltip: 'Effacer la date',
                onPressed: () => setState(() => _date = null),
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
        ValueListenableBuilder(
          valueListenable: _descCtrl,
          builder: (context, value, _) => TextField(
            controller: _descCtrl,
            maxLines: 4,
            maxLength: _maxDesc,
            decoration: InputDecoration(
              hintText: 'Décrivez votre voyage...',
              border: const OutlineInputBorder(),
              counterText: '${value.text.length} / $_maxDesc',
              counterStyle: TextStyle(
                fontSize: 11,
                color: value.text.length >= _maxDesc
                    ? Colors.red
                    : theme.colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ),
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
              imagePaths: _imagePaths,
              imageUrls: _imageUrls,
              readOnly: false,
              onPathsChanged: (paths) => setState(() => _imagePaths = paths),
              onUrlsChanged: (urls) => setState(() => _imageUrls = urls),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // ── Boutons ──
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: widget.onCancel,
              child: const Text('Annuler'),
            ),
            const SizedBox(width: 8),
            FilledButton.icon(
              onPressed: _confirm,
              icon: Icon(widget.confirmIcon, size: 18),
              label: Text(widget.confirmLabel),
            ),
          ],
        ),
      ],
    );
  }
}
