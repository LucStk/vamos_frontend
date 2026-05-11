import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'customPolyEditor.dart';
import 'segment_layers_builder.dart';
import 'segment_type_markers_builder.dart';
import 'waypoint_markers_builder.dart';
import '../models.dart';

class MapView extends StatelessWidget {
  final Trip trip;
  final CustomPolyEditor editor;
  final void Function(LatLng)? onTap;
  final void Function(int)? onSegmentTypeMarkerTap;
  final void Function(int)? onWaypointTap;
  final bool editable;
  final MapController? mapController;

  const MapView({
    Key? key,
    required this.trip,
    required this.editor,
    this.onTap,
    this.onSegmentTypeMarkerTap,
    this.onWaypointTap,
    this.editable = true,
    this.mapController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: LatLng(46.8, 2.2),
        initialZoom: 7,
        onTap: onTap != null ? (_, latLng) => onTap!(latLng) : null,
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
          trip: trip,
          repaintNotifier: editor.repaintNotifier,
          editable: editable,
          onSegmentTypeMarkerTap: onSegmentTypeMarkerTap,
          onWaypointTap: onWaypointTap,
        ),

        // ── DragMarkers ─────────────────────────────────────────────────────
        // FRÈRE (pas enfant) de _LiveSegmentLayer.
        // Ne rebuild QUE quand MapView lui-même rebuild, c'est-à-dire
        // uniquement sur setState de MapPage — jamais pendant un drag actif.
        // Cela préserve les états internes des DragMarkerWidget (position du
        // drag en cours, _isDragging, etc.) et évite la reconciliation par
        // position qui causait le bug.
        if (editable) DragMarkers(markers: editor.edit()),

        // Marqueurs statiques tappables (mode observateur)
        if (!editable && onWaypointTap != null)
          MarkerLayer(
            markers: WaypointMarkersBuilder.buildMarkers(trip, onWaypointTap!),
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
  final void Function(int)? onWaypointTap;

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
