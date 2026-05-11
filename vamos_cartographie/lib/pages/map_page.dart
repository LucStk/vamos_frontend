import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart' hide State, Value, Function;
import 'package:vamos_cartographie/core/failure.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:latlong2/latlong.dart';
import '../map/customPolyEditor.dart';
import '../map/map_view.dart';
import '../models.dart';
import '../widgets/segment_bottom_sheet.dart';
import '../widgets/trip_info_sheet.dart';
import '../widgets/waypoint_bottom_sheet.dart';
import "package:vamos_cartographie/repository/trip_repository.dart";
import 'package:flutter/material.dart';

import 'package:vamos_cartographie/core/injection.dart';

enum AppMode { observer, editor }

// ---------------------------------------------------------------------------
// MapPage
// ---------------------------------------------------------------------------

class MapPage extends StatefulWidget {
  final String? tripId; // L'ID du voyage à charger (optionnel)

  const MapPage({super.key, this.tripId});

  @override
  _MapPageState createState() => _MapPageState();
}

// Permet de charger la Map
class _MapPageState extends State<MapPage> {
  late Trip _trip;
  late CustomPolyEditor _editor;
  bool _isLoading = false;

  AppMode _mode = AppMode.observer;
  bool _addingPoint = false; // actif uniquement en mode éditeur

  @override
  void initState() {
    super.initState();

    _initDefaultTrip();

    if (widget.tripId != null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _loadTripById(widget.tripId!),
      );
    }
  }

  void _initDefaultTrip() {
    _trip = Trip(
      waypoints: [
        Waypoint(
          latLng: LatLng(46.603354, 1.888334),
          type: GWaypointTypeEnum.start,
        ),
        Waypoint(latLng: LatLng(47.0, 2.5), type: GWaypointTypeEnum.end),
      ],
      segments: [Segment(type: GSegmentTypeEnum.bike)],
    );
    _editor = _buildEditor();
  }

  CustomPolyEditor _buildEditor() {
    return CustomPolyEditor(
      trip: _trip,
      // Le repaint pendant le drag est géré par le repaintNotifier de l'éditeur
      // via ValueListenableBuilder dans MapView — pas besoin de setState ici.
      callbackRefresh: (_) {},
      onWaypointLongPress: _showWaypointOptions,
      // Ces deux callbacks déclenchent un setState car ils modifient
      // la structure des markers (insertion / suppression).
      onSegmentMidpointInserted: (_) => setState(() {}),
      onIntermediatePointDeleted: (_, __) => setState(() {}),
    );
  }

  // ── Mode ────────────────────────────────────────────────────────────────

  void _toggleMode() {
    setState(() {
      if (_mode == AppMode.editor) {
        _mode = AppMode.observer;
        _addingPoint = false;
      } else {
        _mode = AppMode.editor;
      }
    });
  }

  bool get _isEditing => _mode == AppMode.editor;

  // ── Bottom sheets ────────────────────────────────────────────────────────

  void _showWaypointOptions(int index) {
    if (!_isEditing) return;
    final wp = _trip.waypoints[index];
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => SafeArea(
        child: WaypointBottomSheet(
          waypointIndex: index,
          trip: _trip,
          onTypeChanged: (type) => setState(() => wp.type = type),
          onDelete: () => setState(() => _trip.removeWaypoint(index)),
          readOnly: false,
        ),
      ),
    );
  }

  void _showWaypointInfo(int index) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => SafeArea(
        child: WaypointBottomSheet(
          waypointIndex: index,
          trip: _trip,
          onTypeChanged: (_) {},
          onDelete: () {},
          readOnly: true,
        ),
      ),
    );
  }

  void _showSegmentOptions(int segmentIndex) {
    if (!_isEditing) return;
    final seg = _trip.segments[segmentIndex];
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: SegmentBottomSheet(
          segmentIndex: segmentIndex,
          trip: _trip,
          onTypeChanged: (type) => setState(() => seg.type = type),
        ),
      ),
    );
  }

  void _showTripInfo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => SafeArea(
        child: TripInfoSheet(
          trip: _trip,
          onChanged: () => setState(() {}),
          readOnly: !_isEditing,
        ),
      ),
    );
  }

  // ── Save / Load ──────────────────────────────────────────────────────────

  Future<void> _saveRoute() async {
    final repository = getIt<TripRepository>();
    final Either<Failure, String> result;

    if (_trip.id != null) {
      result = await repository.updateTrip(_trip);
    } else {
      result = await repository.createTrip(_trip);
    }

    result.fold(
      (failure) {
        _showCustomSnackBar(
          message: 'Erreur sauvegarde : ${failure.toString()}',
          isError: true,
        );
      },
      (id) {
        _showCustomSnackBar(
          message: 'Route sauvegardée avec succès !',
          isError: false,
        );
        _trip.id = id;
      },
    );
  }

  void _showCustomSnackBar({required String message, required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.redAccent : Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Future<void> _loadTripById(String id) async {
    setState(() => _isLoading = true);

    final result = await getIt<TripRepository>().getTrip(id);

    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() => _isLoading = false);
        _showCustomSnackBar(
          message: 'Erreur chargement : ${failure.toString()}',
          isError: true,
        );
      },
      (tripLoaded) {
        setState(() {
          _trip = tripLoaded;
          _editor = _buildEditor();
          _addingPoint = false;
          _isLoading = false;
        });
      },
    );
  }

  Future<void> _loadRoute() async {
    if (_trip.id == null) {
      _showCustomSnackBar(message: 'Aucun voyage à recharger.', isError: true);
      return;
    }
    await _loadTripById(_trip.id!);
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = _trip.title.trim();

    // Écran de chargement pendant la récupération du trip
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text('Chargement du voyage…', style: theme.textTheme.bodyLarge),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // ── Carte ──
          MapView(
            trip: _trip,
            editor: _editor,
            editable: _isEditing,
            onTap: (_isEditing && _addingPoint)
                ? (latLng) => setState(() => _trip.addWaypoint(latLng))
                : null,
            onSegmentTypeMarkerTap: _isEditing ? _showSegmentOptions : null,
            onWaypointTap: !_isEditing ? _showWaypointInfo : null,
          ),

          // ── Bandeau titre ──
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: GestureDetector(
                onTap: _showTripInfo,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.92),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.route,
                        size: 20,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          title.isEmpty ? 'Nouveau voyage' : title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: title.isEmpty
                                ? Colors.grey.shade400
                                : theme.colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Badge de mode
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: _isEditing
                              ? theme.colorScheme.primary.withOpacity(0.12)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(
                            color: _isEditing
                                ? theme.colorScheme.primary.withOpacity(0.4)
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _isEditing ? Icons.edit : Icons.visibility,
                              size: 12,
                              color: _isEditing
                                  ? theme.colorScheme.primary
                                  : Colors.grey.shade500,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _isEditing ? 'Édition' : 'Lecture',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: _isEditing
                                    ? theme.colorScheme.primary
                                    : Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // ── FAB ──
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bouton retour vers l'explorateur
          FloatingActionButton(
            heroTag: 'explorer',
            tooltip: 'Retour aux voyages',
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            foregroundColor: theme.colorScheme.onSurfaceVariant,
            onPressed: () => Navigator.of(context).maybePop(),
            child: const Icon(Icons.list),
          ),
          const SizedBox(height: 12),

          // Bouton mode observateur / éditeur
          FloatingActionButton(
            heroTag: 'mode',
            tooltip: _isEditing
                ? 'Passer en mode lecture'
                : 'Passer en mode édition',
            backgroundColor: _isEditing
                ? theme.colorScheme.primary
                : theme.colorScheme.surfaceContainerHighest,
            foregroundColor: _isEditing
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurfaceVariant,
            onPressed: _toggleMode,
            child: Icon(_isEditing ? Icons.edit : Icons.visibility),
          ),

          // Boutons visibles uniquement en mode éditeur
          if (_isEditing) ...[
            const SizedBox(height: 12),

            // Bouton ajout de point (toggle)
            FloatingActionButton(
              heroTag: 'add',
              tooltip: _addingPoint
                  ? 'Arrêter l\'ajout de points'
                  : 'Ajouter des points',
              backgroundColor: _addingPoint
                  ? theme.colorScheme.tertiary
                  : theme.colorScheme.secondaryContainer,
              foregroundColor: _addingPoint
                  ? theme.colorScheme.onTertiary
                  : theme.colorScheme.onSecondaryContainer,
              onPressed: () => setState(() => _addingPoint = !_addingPoint),
              child: Icon(
                _addingPoint ? Icons.location_off : Icons.add_location_alt,
              ),
            ),
            const SizedBox(height: 12),

            // Sauvegarde
            FloatingActionButton(
              heroTag: 'save',
              tooltip: 'Sauvegarder',
              onPressed: _saveRoute,
              child: const Icon(Icons.save),
            ),
            const SizedBox(height: 12),

            // Chargement
            FloatingActionButton(
              heroTag: 'load',
              tooltip: 'Recharger depuis le serveur',
              onPressed: _loadRoute,
              child: const Icon(Icons.folder_open),
            ),
          ],
        ],
      ),
    );
  }
}
