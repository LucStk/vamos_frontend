import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart' hide State, Value, Function;
import 'package:vamos_cartographie/core/failure.dart';

import 'package:latlong2/latlong.dart';
import '../map/customPolyEditor.dart';
import '../map/map_view.dart';
import '../models.dart';
import '../widgets/map_fab_column.dart';
import '../widgets/map_title_banner.dart';
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
      // Déclenche un setState complet → rebuild de DragMarkers avec
      // ghost points repositionnés. Sûr car utilisé uniquement pour les
      // drags qui ne changent PAS la taille de la liste (waypoints, real
      // intermediate points). Les ghost drags utilisent _repaint() seul.
      callbackRefresh: (_) => setState(() {}),
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
              Text(
                'Chargement du voyage…',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
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
          MapTitleBanner(
            title: title,
            isEditing: _isEditing,
            onTap: _showTripInfo,
          ),
        ],
      ),

      // ── FAB ──
      floatingActionButton: MapFabColumn(
        isEditing: _isEditing,
        isAddingPoint: _addingPoint,
        onToggleMode: _toggleMode,
        onToggleAddPoint: () => setState(() => _addingPoint = !_addingPoint),
        onSave: _saveRoute,
        onReload: _loadRoute,
        onBack: () => Navigator.of(context).maybePop(),
      ),
    );
  }
}
