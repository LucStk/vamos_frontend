import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/i_trip_repository.dart';
import '_trip_info_view.dart';
import '_trip_editor.dart';
import 'package:vamos_cartographie/shared/shared.dart';

class TripViewerDialog extends StatefulWidget {
  final Trip tripData;
  final VoidCallback onExplore;

  const TripViewerDialog({
    super.key,
    required this.tripData,
    required this.onExplore,
  });

  static void show({
    required BuildContext context,
    required Trip tripData,
    required VoidCallback onExplore,
  }) {
    showDialog(
      context: context,
      builder: (ctx) =>
          TripViewerDialog(tripData: tripData, onExplore: onExplore),
    );
  }

  @override
  State<TripViewerDialog> createState() => _TripPreviewDialogState();
}

class _TripPreviewDialogState extends State<TripViewerDialog> {
  Trip? _trip;
  String? _error;

  // 1. AJOUT : Un booléen pour savoir si on est en train d'éditer
  bool _isEditing = false;

  // 2. AJOUT : La clé pour l'éditeur, locale à l'état
  final _editorKey = GlobalKey<TripInfoEditorState>();

  @override
  void initState() {
    super.initState();
    _loadTrip();
  }

  Future<void> _loadTrip() async {
    final result = await getIt<ITripRepository>().getTrip(widget.tripData.id!);
    if (!mounted) return;
    result.fold(
      (failure) => setState(() => _error = failure.message),
      (trip) => setState(() => _trip = trip),
    );
  }

  // 3. NETTOYAGE : L'upload fait maintenant partie de la logique de l'état
  Future<void> _handleUpdate(Trip editedTrip) async {
    final saveResult = await getIt<ITripRepository>().updateTrip(
      editedTrip.id!,
      editedTrip,
    );

    if (!mounted) return;

    saveResult.fold((failure) => setState(() => _error = failure.message), (_) {
      // En cas de succès : On met à jour le trip local et on repasse en mode lecture !
      setState(() {
        _trip = editedTrip;
        _isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Voyage mis à jour avec succès !')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_trip == null && _error == null) return _showLoading();
    if (_error != null) return _showError();

    // 4. LA NORME : On switche le contenu du Dialog selon le mode (_isEditing)
    if (_isEditing) {
      return DialogShell(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),
        content: TripInfoEditor(key: _editorKey, initialTrip: _trip!),
        buttonsBuilder: (ctx) => [
          CancelButton(onPressed: () => setState(() => _isEditing = false)),
          const Spacer(),
          ConfirmButton(
            onPressed: () {
              final edited = _editorKey.currentState?.currentTrip;
              if (edited != null) _handleUpdate(edited);
            },
          ),
        ],
      );
    }

    // Mode Lecture Seule (Visualisation)
    return DialogShell(
      content: TripInfoView(trip: _trip!),
      buttonsBuilder: (ctx) => [
        ModifierButton(
          onPressed: () =>
              setState(() => _isEditing = true), // On passe en édition
        ),
        const SizedBox(width: 8),
        ExploreButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onExplore();
          },
        ),
      ],
    );
  }

  // (Les widgets de chargement et d'erreur restent identiques mais sans besoin du BuildContext en paramètre)
  Widget _showError() => DialogErrorBody(errorMessage: _error!);
  Widget _showLoading() => const DialogLoadingBody();
}
