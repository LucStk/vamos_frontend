import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';

import 'package:vamos_cartographie/widgets/carousel/carousel.dart';
import 'package:vamos_cartographie/domain/domain.dart';
import 'package:vamos_cartographie/domain/trip_image.dart';
import "waypoint_header.dart";
import '../text_area_counter.dart';
import 'waypoint_editor.dart';
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
  late List<TripImage> _pendingImages;

  @override
  void initState() {
    super.initState();
    _isEditing = !widget.readOnly;
    final wp = _wp;
    _selectedType = wp.type;
    _pendingDescription = wp.description ?? '';
    _pendingImages = List<TripImage>.from(wp.images ?? []);
  }

  Waypoint get _wp => widget.trip.waypoints[widget.waypointIndex];

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
                WaypointHeader(
                  type: _selectedType,
                  index: widget.waypointIndex,
                ),
                const SizedBox(height: 16),

                // Photos
                ImageCarouselPicker(
                  remoteImages: wp.images ?? [],
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

  // À insérer dans _WaypointCardState, juste en dessous de _buildViewer:
  Widget _buildEditor(BuildContext context) {
    return WaypointEditor(
      waypointIndex: widget.waypointIndex,
      selectedType: _selectedType,
      pendingDescription: _pendingDescription,
      pendingImages: _pendingImages,
      onTypeChanged: (type) {
        setState(() => _selectedType = type);
      },
      onDescriptionChanged: (value) {
        _pendingDescription =
            value; // Pas de setState nécessaire si TextArea gère son propre texte en local
      },
      onImagesChanged: (images) {
        setState(() => _pendingImages = List<TripImage>.from(images));
      },
      onDelete: () {
        widget.onDelete();
        Navigator.of(context).pop();
      },
      onCancel: () {
        // Si on était en mode "readOnly" à la base, on retourne au Viewer.
        // Sinon, on ferme le dialog.
        if (widget.readOnly) {
          setState(() {
            // On réinitialise les modifs en cours avec les vraies valeurs du Waypoint
            final wp = _wp;
            _selectedType = wp.type;
            _pendingDescription = wp.description ?? '';
            _pendingImages = List<TripImage>.from(wp.images ?? []);
            _isEditing = false;
          });
        } else {
          Navigator.of(context).pop();
        }
      },
      onConfirm: () {
        final wp = _wp;
        wp.description = _pendingDescription;
        wp.images
          ?..clear()
          ..addAll(_pendingImages);

        widget.onTypeChanged(_selectedType);

        // Si tu as un callback global d'édition passé au parent
        if (widget.onEdit != null) widget.onEdit!();

        Navigator.of(context).pop();
      },
    );
  }
}

// ── _WaypointHeader ───────────────────────────────────────────────────────────
