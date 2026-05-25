import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';

class MapView extends StatefulWidget {
  final Trip trip;
  final CustomPolyEditor editor;
  final void Function(LatLng)? onTap;
  final void Function(int)? onSegmentTypeMarkerTap;
  final void Function(Waypoint)? onWaypointTap;
  final bool editable;
  final MapController? mapController;

  /// Options affichées dans le menu contextuel (clic sur la carte).
  /// Si la liste est vide ou null, aucun menu n'apparaît au clic.
  final List<MapContextMenuOption>? contextMenuOptions;

  const MapView({
    Key? key,
    required this.trip,
    required this.editor,
    this.onTap,
    this.onSegmentTypeMarkerTap,
    this.onWaypointTap,
    this.editable = true,
    this.mapController,
    this.contextMenuOptions,
  }) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  LatLng? _contextMenuPosition;

  void _handleTap(LatLng latLng) {
    final hasMenu =
        widget.contextMenuOptions != null &&
        widget.contextMenuOptions!.isNotEmpty;

    if (hasMenu) {
      // Priorité au menu contextuel : on l'ouvre (ou on le déplace)
      setState(() => _contextMenuPosition = latLng);
    } else if (widget.onTap != null) {
      widget.onTap!(latLng);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: widget.mapController,
      options: MapOptions(
        initialCenter: LatLng(46.8, 2.2),
        initialZoom: 7,
        onTap: (_, latLng) => _handleTap(latLng),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.vamos_cartographie',
        ),

        // ── Couche "vivante" ────────────────────────────────────────────────
        // Se redessine à chaque repaintNotifier++ (pendant le drag) pour
        // mettre à jour les polylines. DragMarkers n'est PAS ici.
        _LiveSegmentLayer(
          trip: widget.trip,
          repaintNotifier: widget.editor.repaintNotifier,
          editable: widget.editable,
          onSegmentTypeMarkerTap: widget.onSegmentTypeMarkerTap,
          onWaypointTap: widget.onWaypointTap,
        ),

        // ── DragMarkers ─────────────────────────────────────────────────────
        // FRÈRE (pas enfant) de _LiveSegmentLayer.
        // Ne rebuild QUE quand MapView lui-même rebuild, c'est-à-dire
        // uniquement sur setState de MapPage — jamais pendant un drag actif.
        // Cela préserve les états internes des DragMarkerWidget (position du
        // drag en cours, _isDragging, etc.) et évite la reconciliation par
        // position qui causait le bug.
        if (widget.editable) DragMarkers(markers: widget.editor.edit()),

        // Marqueurs statiques tappables (mode observateur)
        if (!widget.editable && widget.onWaypointTap != null)
          MarkerLayer(
            markers: WaypointMarkersBuilder.buildMarkers(
              widget.trip,
              widget.onWaypointTap!,
            ),
          ),

        // ── Menu contextuel géo-ancré ────────────────────────────────────
        if (_contextMenuPosition != null &&
            widget.contextMenuOptions != null &&
            widget.contextMenuOptions!.isNotEmpty)
          MapContextMenu(
            position: _contextMenuPosition!,
            options: widget.contextMenuOptions!,
            onClose: () => setState(() => _contextMenuPosition = null),
          ),
      ],
    );
  }
}

// ── _LiveSegmentLayer ─────────────────────────────────────────────────────────
// Widget interne qui s'abonne au repaintNotifier du CustomPolyEditor.
// Il ne contient QUE les polylines et les marqueurs de type de segment —
// pas les DragMarkers.

class _LiveSegmentLayer extends StatefulWidget {
  final Trip trip;
  final ValueNotifier<int> repaintNotifier;
  final bool editable;
  final void Function(int)? onSegmentTypeMarkerTap;
  final void Function(Waypoint)? onWaypointTap;

  const _LiveSegmentLayer({
    required this.trip,
    required this.repaintNotifier,
    required this.editable,
    this.onSegmentTypeMarkerTap,
    this.onWaypointTap,
  });

  @override
  State<_LiveSegmentLayer> createState() => _LiveSegmentLayerState();
}

class _LiveSegmentLayerState extends State<_LiveSegmentLayer> {
  @override
  void initState() {
    super.initState();
    widget.repaintNotifier.addListener(_rebuild);
  }

  void _rebuild() => setState(() {});

  @override
  void dispose() {
    widget.repaintNotifier.removeListener(_rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Lignes des segments (se mettent à jour pendant le drag)
        ...SegmentLayersBuilder.buildLayers(widget.trip),

        // Marqueurs de type de segment
        MarkerLayer(
          markers: widget.onSegmentTypeMarkerTap != null
              ? SegmentTypeMarkersBuilder.buildMarkers(
                  widget.trip,
                  widget.onSegmentTypeMarkerTap!,
                )
              : [],
        ),
      ],
    );
  }
}
