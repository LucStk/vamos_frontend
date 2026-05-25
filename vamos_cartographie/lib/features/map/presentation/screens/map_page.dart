import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum _MapMode { observer, editRoute, addPoint }

// ---------------------------------------------------------------------------
// MapPage
// ---------------------------------------------------------------------------

// Remplacer StatefulWidget par ConsumerStatefulWidget
class MapPage extends ConsumerStatefulWidget {
  final int? tripId;
  final bool isOwner;

  const MapPage({super.key, this.tripId, this.isOwner = true});

  @override
  MapPageState createState() => MapPageState();
}

// Remplacer State<MapPage> par ConsumerState<MapPage>
class MapPageState extends ConsumerState<MapPage> {
  // ... tout ton code existant reste accessible via "ref"class _MapPageState extends State<MapPage> {
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
      onSegmentMidpointInserted: (_) => setState(() => _isDirty = true),
      onIntermediatePointDeleted: (_, __) => setState(() => _isDirty = true),
    );
  }

  Future<void> _saveChanges() async {
    if (widget.tripId == null) return;

    setState(() => _isLoading = true);

    try {
      // Appel de la méthode save du Notifier via ref.read
      await ref.read(tripProvider(widget.tripId!).notifier).save(_trip);

      _showSnackBar(message: 'Voyage enregistré avec succès', isError: false);

      setState(() {
        _mode = _MapMode.observer;
        _isDirty = false;
      });
    } catch (e) {
      _showSnackBar(
        message: 'Erreur lors de la sauvegarde : $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
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

  // /// Active le mode ajout de point.
  // void _enterAddPoint() {
  //   _waypointsCountBeforeAdd = _trip.waypoints.length;
  //   setState(() {
  //     _mode = _MapMode.addPoint;
  //     _isDirty = false;
  //   });
  // }

  /// Accepte le ou les points ajoutés, sauvegarde et repasse en observer.
  Future<void> _confirmAddPoint() async {
    throw Exception("Error not instancied in _confirmAddPoint in map_page");
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

  /// Ouvre la fiche waypoint en mode lecture (avec bouton "Modifier" si owner).
  void _showWaypointInfo(Waypoint waypoint) {
    WaypointViewerDialog.show(
      context: context,
      waypoint: waypoint,
      onEdit: () {
        throw Exception(
          "Dans map_page -> _showWaypointInfo : pas de onEdit instancié",
        );
      },
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
      if (choice == 'save') {
        await _saveChanges();
      }
    }
    if (mounted) Navigator.of(context).pop();
  }

  // ── Menu contextuel ─────────────────────────────────────────────────────

  /// Construit la liste des options du menu contextuel (clic sur la carte).
  ///
  /// C'est ici qu'il faut ajouter de nouvelles actions au fil du temps.
  List<MapContextMenuOption> _buildContextMenuOptions() {
    return [
      // ── Ajouter un waypoint à cet endroit ─────────────────────────────
      if (widget.isOwner)
        MapContextMenuOption(
          icon: Icons.add_location_alt,
          label: 'Créer un point',
          onTap: (latLng) async {
            setState(() {
              _trip.addWaypoint(latLng);
              _isDirty = true;
            });
            await _saveChanges(); // Sauvegarde automatique après l'ajout rapide
          },
        ),

      // ── Déplacer la carte ici (centrer) ───────────────────────────────
      MapContextMenuOption(
        icon: Icons.my_location,
        label: 'Centrer ici',
        onTap: (latLng) {
          _mapController.move(latLng, _mapController.camera.zoom);
        },
      ),
    ];
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    // Si aucun ID n'est fourni, on peut soit lever une erreur soit utiliser un comportement par défaut.
    if (widget.tripId == null) {
      return const Scaffold(
        body: Center(child: Text("ID de voyage manquant.")),
      );
    }

    // Écoute de l'état asynchrone du voyage
    final tripAsync = ref.watch(tripProvider(widget.tripId!));

    return tripAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) =>
          Scaffold(body: Center(child: Text('Erreur : $err'))),
      data: (tripFromProvider) {
        // Synchronisation de notre variable locale pour l'éditeur de carte
        _trip = tripFromProvider;

        final title = _trip.title.trim();

        return PopScope(
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
                  onTap: _isAddingPoint
                      ? (latLng) => setState(() {
                          _trip.addWaypoint(latLng);
                          _isDirty = true;
                        })
                      : null,
                  contextMenuOptions: _mode == _MapMode.observer
                      ? _buildContextMenuOptions()
                      : null,
                  onSegmentTypeMarkerTap: _isEditing
                      ? _showSegmentOptions
                      : null,
                  onWaypointTap: _showWaypointInfo,
                ),

                // ── Barre supérieure ─────────────────────────────────────────
                MapTopBar(
                  title: title.isEmpty ? 'Sans titre' : title,
                  isDirty: _isDirty,
                  onBack: _handleBack,
                  onTitleTap: () {},
                ),

                // ── Boutons de contrôle carte ─────────────────────────────────
                MapControls(mapController: _mapController),

                // ── Boutons flottants owner-only ──────────────────────────────
                if (widget.isOwner && _mode == _MapMode.observer) ...[
                  MapEditFab(isActive: false, onTap: _enterEditRoute),
                ],

                // ── Barre basse : mode édition route ─────────────────────────
                if (_isEditing)
                  MapEditRouteBar(
                    onSave: _saveChanges, // Implémenté ci-dessous
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
      },
    );
  }
}
