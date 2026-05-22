import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';

import 'package:vamos_cartographie/domain/domain.dart';
import 'waypoint_viewer.dart';
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
  final void Function(GWaypointEnum) onTypeChanged;
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
    required void Function(GWaypointEnum) onTypeChanged,
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
  late GWaypointEnum _selectedType;

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
    return WaypointViewer(waypoint: _wp,
    onEdit:() => setState(() => _isEditing = true)
      
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
