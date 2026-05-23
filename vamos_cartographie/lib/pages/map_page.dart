import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/core/failure.dart';

import 'package:latlong2/latlong.dart';
import '../map/customPolyEditor.dart';
import '../map/map_view.dart';
import "package:vamos_cartographie/domain/domain.dart";
import 'package:vamos_cartographie/domain/trip_image.dart';

import '../widgets/map/map_controls.dart';
import '../widgets/map/map_edit_toolbar.dart';
import '../widgets/map/map_top_bar.dart';
import '../widgets/segment/segment_bottom_sheet.dart';
import '../widgets/waypoints/waypoint_sheet.dart';
import 'package:vamos_cartographie/data/repositories/i_trip_repository.dart';
import 'package:flutter/material.dart';

import 'package:vamos_cartographie/core/injection.dart';

// ---------------------------------------------------------------------------
// Modes de la page
// ---------------------------------------------------------------------------

/// Mode de la page carte.
///
/// - [observer]  : lecture seule, aucun outil d'édition visible.
/// - [editRoute] : édition des segments (drag, midpoints, types…).
/// - [addPoint]  : tap sur la carte pour ajouter un waypoint.
enum _MapMode { observer, editRoute, addPoint }

// ---------------------------------------------------------------------------
// MapPage
// ---------------------------------------------------------------------------

class MapPage extends StatefulWidget {
  /// L'ID du voyage à charger (optionnel).
  final int? tripId;

  /// Indique si l'utilisateur courant est propriétaire du voyage.
  ///
  /// `true`  → tous les boutons d'édition sont affichés.
  /// `false` → interface en lecture seule (exploration).
  ///
  /// Défaut : `true` pour faciliter le développement tant que les comptes
  /// utilisateurs ne sont pas implémentés.
  final bool isOwner;

  const MapPage({super.key, this.tripId, this.isOwner = true});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late Trip _trip;
  late CustomPolyEditor _editor;
  bool _isLoading = false;

  _MapMode _mode = _MapMode.observer;

  final MapController _mapController = MapController();

  /// true dès qu'une modification non sauvegardée existe dans l'un ou l'autre
  /// des modes d'édition (route OU ajout de point).
  bool _isDirty = false;

  // ── Snaphot de la route avant entrée en mode editRoute ──────────────────
  // Permet d'annuler les modifications.
  List<Waypoint>? _routeSnapshot;
  List<Segment>? _segmentsSnapshot;

  // ── Points ajoutés en mode addPoint (pour pouvoir annuler) ──────────────
  int _waypointsCountBeforeAdd = 0;

  // ── Accesseurs ───────────────────────────────────────────────────────────

  bool get _isEditing => _mode == _MapMode.editRoute;
  bool get _isAddingPoint => _mode == _MapMode.addPoint;

  // ── Init ─────────────────────────────────────────────────────────────────

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
          type: GWaypointEnum.START,
        ),
        Waypoint(latLng: LatLng(47.0, 2.5), type: GWaypointEnum.END),
      ],
      segments: [Segment(type: GSegmentTypeEnum.bike)],
    );
    _editor = _buildEditor();
  }

  CustomPolyEditor _buildEditor() {
    return CustomPolyEditor(
      trip: _trip,
      callbackRefresh: (_) => setState(() => _isDirty = true),
      onWaypointLongPress: _onWaypointLongPress,
      onSegmentMidpointInserted: (_) => setState(() => _isDirty = true),
      onIntermediatePointDeleted: (_, __) => setState(() => _isDirty = true),
    );
  }

  // ── Gestion des modes ─────────────────────────────────────────────────────

  /// Active le mode édition de route.
  /// Prend un snapshot pour permettre l'annulation.
  void _enterEditRoute() {
    _routeSnapshot = _trip.waypoints
        .map(
          (w) => Waypoint(
            id: w.id,
            latLng: LatLng(w.latLng.latitude, w.latLng.longitude),
            type: w.type,
            description: w.description,
            images: List<TripImage>.from(w.images ?? []),
          ),
        )
        .toList();
    _segmentsSnapshot = _trip.segments
        .map(
          (s) => Segment(
            id: s.id,
            type: s.type,
            intermediatePoints: List<LatLng>.from(s.intermediatePoints),
          ),
        )
        .toList();
    setState(() {
      _mode = _MapMode.editRoute;
      _isDirty = false;
    });
  }

  /// Sauvegarde la route et repasse en mode observer.
  Future<void> _saveAndExitEditRoute() async {
    await _saveTrip();
    if (mounted) {
      setState(() {
        _mode = _MapMode.observer;
        _isDirty = false;
      });
    }
  }

  /// Annule les modifications de route et restaure le snapshot.
  void _cancelEditRoute() {
    if (_routeSnapshot != null) {
      _trip.waypoints
        ..clear()
        ..addAll(_routeSnapshot!);
      _trip.segments
        ..clear()
        ..addAll(_segmentsSnapshot!);
      _editor = _buildEditor();
    }
    setState(() {
      _mode = _MapMode.observer;
      _isDirty = false;
    });
  }

  /// Active le mode ajout de point.
  void _enterAddPoint() {
    _waypointsCountBeforeAdd = _trip.waypoints.length;
    setState(() {
      _mode = _MapMode.addPoint;
      _isDirty = false;
    });
  }

  /// Accepte le ou les points ajoutés, sauvegarde et repasse en observer.
  Future<void> _confirmAddPoint() async {
    await _saveTrip();
    if (mounted) {
      setState(() {
        _mode = _MapMode.observer;
        _isDirty = false;
      });
    }
  }

  /// Supprime les points ajoutés en mode addPoint et repasse en observer.
  void _cancelAddPoint() {
    // Retire les waypoints (et segments associés) ajoutés depuis l'entrée du mode.
    final added = _trip.waypoints.length - _waypointsCountBeforeAdd;
    for (var i = 0; i < added; i++) {
      _trip.removeWaypoint(_trip.waypoints.length - 1);
    }
    setState(() {
      _mode = _MapMode.observer;
      _isDirty = false;
    });
  }

  // ── Gestion du waypoint long-press ───────────────────────────────────────

  void _onWaypointLongPress(int index) {
    if (!_isEditing) return;
    _showWaypointEditor(index);
  }

  // ── Dialogs waypoints / segments ─────────────────────────────────────────

  /// Ouvre la fiche waypoint en mode édition.
  void _showWaypointEditor(int index) {
    final wp = _trip.waypoints[index];
    WaypointCard.show(
      context: context,
      waypointIndex: index,
      trip: _trip,
      onTypeChanged: (type) => setState(() {
        wp.type = type;
        _isDirty = true;
      }),
      onDelete: () => setState(() {
        _trip.removeWaypoint(index);
        _isDirty = true;
      }),
      readOnly: false,
    );
  }

  /// Ouvre la fiche waypoint en mode lecture (avec bouton "Modifier" si owner).
  void _showWaypointInfo(int index) {
    WaypointCard.show(
      context: context,
      waypointIndex: index,
      trip: _trip,
      onTypeChanged: (type) => setState(() {
        _trip.waypoints[index].type = type;
        _isDirty = true;
      }),
      onDelete: () => setState(() {
        _trip.removeWaypoint(index);
        _isDirty = true;
      }),
      readOnly: true,
      // Le bouton "Modifier" n'est proposé qu'au propriétaire
      onEdit: widget.isOwner ? () => _showWaypointEditor(index) : null,
    );
  }

  /// Ouvre la fiche segment (édition uniquement, accessible en mode editRoute).
  void _showSegmentOptions(int segmentIndex) {
    if (!_isEditing) return;
    final seg = _trip.segments[segmentIndex];
    SegmentCard.show(
      context: context,
      segmentIndex: segmentIndex,
      trip: _trip,
      onTypeChanged: (type) => setState(() {
        seg.type = type;
        _isDirty = true;
      }),
    );
  }

  // ── Sauvegarde backend ────────────────────────────────────────────────────

  Future<void> _saveTrip() async {
    final repository = getIt<ITripRepository>();
    final Either<Failure, Trip> result;

    if (_trip.id != null) {
      result = await repository.updateTrip(_trip.id!, _trip);
    } else {
      result = await repository.createTrip(_trip);
    }

    if (!mounted) return;

    result.fold(
      (failure) => _showSnackBar(
        message: 'Erreur sauvegarde : ${failure.toString()}',
        isError: true,
      ),
      (savedTrip) {
        _showSnackBar(message: 'Voyage sauvegardé !', isError: false);
        setState(() {
          _trip.id = savedTrip.id;
          _isDirty = false;
        });
      },
    );
  }

  void _showSnackBar({required String message, required bool isError}) {
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

  // ── Chargement ────────────────────────────────────────────────────────────

  Future<void> _loadTripById(int id) async {
    setState(() => _isLoading = true);

    final result = await getIt<ITripRepository>().getTrip(id);

    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() => _isLoading = false);
        _showSnackBar(
          message: 'Erreur chargement : ${failure.toString()}',
          isError: true,
        );
      },
      (tripLoaded) {
        setState(() {
          _trip = tripLoaded;
          _editor = _buildEditor();
          _mode = _MapMode.observer;
          _isDirty = false;
          _isLoading = false;
        });
      },
    );
  }

  // ── Navigation retour ────────────────────────────────────────────────────

  Future<void> _handleBack() async {
    // Si un mode d'édition est actif avec des modifs non sauvegardées,
    // demander confirmation avant de quitter la page.
    if (_isDirty && _mode != _MapMode.observer) {
      final choice = await showDialog<String>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Modifications non enregistrées'),
          content: const Text('Voulez-vous sauvegarder avant de quitter ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop('discard'),
              child: const Text('Ignorer'),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop('cancel'),
              child: const Text('Annuler'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop('save'),
              child: const Text('Sauvegarder'),
            ),
          ],
        ),
      );
      if (choice == 'cancel' || choice == null) return;
      if (choice == 'save') await _saveTrip();
    }
    if (mounted) Navigator.of(context).pop();
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Chargement du voyage…',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      );
    }

    final title = _trip.title.trim();

    return PopScope(
      // Bloque le retour système uniquement quand il y a des modifs non sauvegardées
      // en mode édition, pour afficher le dialog de confirmation.
      canPop: !(_isDirty && _mode != _MapMode.observer),
      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop) await _handleBack();
      },
      child: Scaffold(
        body: Stack(
          children: [
            // ── Carte plein écran ────────────────────────────────────────
            MapView(
              trip: _trip,
              editor: _editor,
              editable: _isEditing,
              mapController: _mapController,
              // En mode ajout : tap = ajouter un waypoint
              onTap: _isAddingPoint
                  ? (latLng) => setState(() {
                      _trip.addWaypoint(latLng);
                      _isDirty = true;
                    })
                  : null,
              onSegmentTypeMarkerTap: _isEditing ? _showSegmentOptions : null,
              // Tap waypoint : info en lecture, édition si on est en train
              // d'éditer la route
              onWaypointTap: _isEditing
                  ? _showWaypointEditor
                  : _showWaypointInfo,
            ),

            // ── Barre supérieure ─────────────────────────────────────────
            MapTopBar(
              title: title,
              isDirty: _isDirty,
              onBack: _handleBack,
              onTitleTap: () {},
            ),

            // ── Boutons de contrôle carte ─────────────────────────────────
            MapControls(mapController: _mapController),

            // ── Boutons flottants owner-only ──────────────────────────────
            if (widget.isOwner && _mode == _MapMode.observer) ...[
              // Bouton "Modifier route"
              MapEditFab(isActive: false, onTap: _enterEditRoute),
              // Bouton "Ajouter point"
              MapAddPointFab(isActive: false, onTap: _enterAddPoint),
            ],

            // ── Barre basse : mode édition route ─────────────────────────
            if (_isEditing)
              MapEditRouteBar(
                onSave: _saveAndExitEditRoute,
                onCancel: _cancelEditRoute,
              ),

            // ── Barre basse : mode ajout de point ─────────────────────────
            if (_isAddingPoint)
              MapAddPointBar(
                onConfirm: _confirmAddPoint,
                onCancel: _cancelAddPoint,
              ),
          ],
        ),
      ),
    );
  }
}
