import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'image_carousel_picker.dart';
import '../models.dart';
import 'text_area_counter.dart';

// ── WaypointCard ──────────────────────────────────────────────────────────────

/// Affiche les informations d'un waypoint dans un Dialog centré (Card).
///
/// - En mode lecture ([readOnly] = true) : affiche l'en-tête, les photos et
///   la description, avec les boutons "Fermer" et optionnellement "Modifier".
/// - En mode édition ([readOnly] = false) : permet de changer le type, les
///   photos, la description et de supprimer le waypoint.
///
/// Le switch lecture → édition s'effectue **dans le même dialog** via un
/// [StatefulBuilder] interne : aucun fermer/rouvrir.
class WaypointCard extends StatefulWidget {
  final int waypointIndex;
  final Trip trip;
  final void Function(GWaypointTypeEnum) onTypeChanged;
  final void Function() onDelete;
  final bool readOnly;
  final VoidCallback? onEdit;

  const WaypointCard({
    super.key,
    required this.waypointIndex,
    required this.trip,
    required this.onTypeChanged,
    required this.onDelete,
    this.readOnly = false,
    this.onEdit,
  });

  // ── Méthode statique show ─────────────────────────────────────────────────

  static void show({
    required BuildContext context,
    required int waypointIndex,
    required Trip trip,
    required void Function(GWaypointTypeEnum) onTypeChanged,
    required void Function() onDelete,
    bool readOnly = false,
    VoidCallback? onEdit,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => WaypointCard(
        waypointIndex: waypointIndex,
        trip: trip,
        onTypeChanged: onTypeChanged,
        onDelete: onDelete,
        readOnly: readOnly,
        onEdit: onEdit,
      ),
    );
  }

  @override
  State<WaypointCard> createState() => _WaypointCardState();
}

// ── _WaypointCardState ────────────────────────────────────────────────────────

class _WaypointCardState extends State<WaypointCard> {
  // Mode courant (peut basculer lecture → édition sans fermer le dialog).
  late bool _isEditing;

  // Type sélectionné dans l'éditeur (local, appliqué à la confirmation).
  late GWaypointTypeEnum _selectedType;

  // Copies locales des champs éditables — appliquées seulement à la confirmation.
  late String _pendingDescription;
  late List<String> _pendingImages;

  @override
  void initState() {
    super.initState();
    _isEditing = !widget.readOnly;
    final wp = _wp;
    _selectedType = wp.type;
    _pendingDescription = wp.description ?? '';
    _pendingImages = List<String>.from(wp.images ?? []);
  }

  Waypoint get _wp => widget.trip.waypoints[widget.waypointIndex];

  // ── Confirmation des modifications ───────────────────────────────────────

  void _confirm() {
    final wp = _wp;
    wp.description = _pendingDescription;
    wp.images
      ?..clear()
      ..addAll(_pendingImages);
    widget.onTypeChanged(_selectedType);
    Navigator.of(context).pop();
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 600),
        child: _isEditing ? _buildEditor(context) : _buildViewer(context),
      ),
    );
  }

  // ── Vue lecture ───────────────────────────────────────────────────────────

  Widget _buildViewer(BuildContext context) {
    final wp = _wp;
    final hasDescription = wp.description != null && wp.description!.isNotEmpty;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Contenu scrollable ──
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _WaypointHeader(
                  type: _selectedType,
                  index: widget.waypointIndex,
                ),
                const SizedBox(height: 16),

                // Photos
                ImageCarouselPicker(
                  remoteImagesPaths: wp.images ?? [],
                  readOnly: true,
                  onChanged: (_) {},
                ),

                // Description
                if (hasDescription) ...[
                  const SizedBox(height: 12),
                  TextAreaWithCounter(
                    initialValue: wp.description!,
                    readOnly: true,
                    onChanged: (_) {},
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),

        // ── Boutons ──
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Fermer'),
              ),
              const Spacer(),
              if (widget.onEdit != null)
                OutlinedButton.icon(
                  onPressed: () {
                    // Bascule en mode édition dans le même dialog.
                    setState(() => _isEditing = true);
                  },
                  icon: const Icon(Icons.edit_outlined, size: 16),
                  label: const Text('Modifier'),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Vue édition ───────────────────────────────────────────────────────────

  Widget _buildEditor(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Contenu scrollable ──
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _WaypointHeader(
                  type: _selectedType,
                  index: widget.waypointIndex,
                ),
                const SizedBox(height: 12),

                // ── Sélecteur de type ──
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: GWaypointTypeEnum.values.map((type) {
                      final selected = _selectedType == type;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedType = type),
                        child: Container(
                          width: 72,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: selected
                                ? type.color.withOpacity(0.15)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selected
                                  ? type.color
                                  : Colors.grey.shade300,
                              width: selected ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(type.icon, color: type.color, size: 24),
                              const SizedBox(height: 4),
                              Text(
                                type.label,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: selected ? type.color : Colors.black87,
                                  fontWeight: selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const Divider(),

                // ── Photos ──
                const SizedBox(height: 4),
                ImageCarouselPicker(
                  remoteImagesPaths: _pendingImages,
                  readOnly: false,
                  onChanged: (urls) =>
                      setState(() => _pendingImages = List<String>.from(urls)),
                ),

                // ── Description ──
                const Divider(),
                TextAreaWithCounter(
                  initialValue: _pendingDescription,
                  readOnly: false,
                  onChanged: (value) => _pendingDescription = value,
                ),

                // ── Suppression ──
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('Supprimer ce waypoint'),
                  onTap: () {
                    widget.onDelete();
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),

        // ── Boutons ──
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Annuler'),
              ),
              const Spacer(),
              FilledButton(onPressed: _confirm, child: const Text('Confirmer')),
            ],
          ),
        ),
      ],
    );
  }
}

// ── _WaypointHeader ───────────────────────────────────────────────────────────

/// En-tête commune (icône colorée, label du type, numéro d'étape).
class _WaypointHeader extends StatelessWidget {
  final GWaypointTypeEnum type;
  final int index;

  const _WaypointHeader({required this.type, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: type.color, shape: BoxShape.circle),
          child: Icon(type.icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type.label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: type.color,
              ),
            ),
            Text(
              'Étape ${index + 1}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
      ],
    );
  }
}
