import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models.dart';
import 'image_carousel_picker.dart';

class TripInfoSheet extends StatefulWidget {
  final Trip trip;
  final void Function() onChanged;
  final bool readOnly;

  const TripInfoSheet({
    super.key,
    required this.trip,
    required this.onChanged,
    this.readOnly = false,
  });

  @override
  State<TripInfoSheet> createState() => _TripInfoSheetState();
}

class _TripInfoSheetState extends State<TripInfoSheet> {
  final ScrollController _scrollController = ScrollController();
  late final TextEditingController _titleController;
  late final TextEditingController _descController;
  static const int _maxDesc = 1000;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.trip.title);
    _descController = TextEditingController(text: widget.trip.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: widget.trip.date ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('fr', 'FR'),
    );
    if (picked == null) return;
    setState(() => widget.trip.date = picked);
    widget.onChanged();
  }

  void _clearDate() {
    setState(() => widget.trip.date = null);
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final info = widget.trip;
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            children: [
              // Poignée
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),

              // En-tête
              Row(
                children: [
                  Icon(Icons.route, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Informations du voyage',
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Contenu scrollable
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ── Titre ──
                      TextField(
                        controller: _titleController,
                        readOnly: widget.readOnly,
                        decoration: InputDecoration(
                          labelText: 'Titre du voyage',
                          hintText: widget.readOnly
                              ? ''
                              : 'Ex : Tour de Bretagne 2025',
                          prefixIcon: const Icon(Icons.title),
                          border: const OutlineInputBorder(),
                          filled: widget.readOnly,
                          fillColor: Colors.grey.shade50,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        onChanged: widget.readOnly
                            ? null
                            : (v) {
                                info.title = v;
                                widget.onChanged();
                              },
                      ),
                      const SizedBox(height: 16),

                      // ── Date ──
                      _SectionLabel(label: 'Date du voyage'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.calendar_today, size: 18),
                              label: Text(
                                info.date != null
                                    ? DateFormat(
                                        'dd MMMM yyyy',
                                        'fr_FR',
                                      ).format(info.date!)
                                    : 'Choisir une date',
                                style: TextStyle(
                                  color: info.date != null
                                      ? theme.colorScheme.onSurface
                                      : Colors.grey,
                                ),
                              ),
                              onPressed: widget.readOnly ? null : _pickDate,
                            ),
                          ),
                          if (!widget.readOnly && info.date != null) ...[
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.clear, size: 20),
                              tooltip: 'Effacer la date',
                              onPressed: _clearDate,
                              color: Colors.grey,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 16),

                      // ── Description ──
                      _SectionLabel(label: 'Description'),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _descController,
                        readOnly: widget.readOnly,
                        maxLines: 5,
                        maxLength: widget.readOnly ? null : _maxDesc,
                        decoration: InputDecoration(
                          hintText: widget.readOnly
                              ? ''
                              : 'Décrivez votre voyage...',
                          alignLabelWithHint: true,
                          border: const OutlineInputBorder(),
                          filled: widget.readOnly,
                          fillColor: Colors.grey.shade50,
                          counter: widget.readOnly
                              ? const SizedBox.shrink()
                              : ValueListenableBuilder(
                                  valueListenable: _descController,
                                  builder: (context, value, _) => Text(
                                    '${value.text.length} / $_maxDesc',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: value.text.length >= _maxDesc
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                        ),
                        onChanged: widget.readOnly
                            ? null
                            : (v) {
                                info.description = v;
                                widget.onChanged();
                              },
                      ),
                      const SizedBox(height: 16),

                      // ── Photos ──
                      _SectionLabel(label: 'Photos du voyage'),
                      const SizedBox(height: 8),
                      ImageCarouselPicker(
                        imagePaths: info.imagePaths,
                        readOnly: widget.readOnly,
                        onChanged: widget.readOnly
                            ? (_) {}
                            : (paths) {
                                setState(() => info.imagePaths = paths);
                                widget.onChanged();
                              },
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary,
        letterSpacing: 0.4,
      ),
    );
  }
}
