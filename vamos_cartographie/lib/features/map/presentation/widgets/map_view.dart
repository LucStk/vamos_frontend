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

  final bool editable;

  final MapController? mapController;

  final void Function(Waypoint)? onWaypointTap;

  final void Function(int)? onSegmentTypeMarkerTap;

  final List<MapContextAction>? contextMenuActions;

  const MapView({
    super.key,
    required this.trip,
    required this.editor,
    required this.editable,
    this.mapController,
    this.onWaypointTap,
    this.onSegmentTypeMarkerTap,
    this.contextMenuActions,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  LatLng? _contextMenuPosition;

  void _handleTap(LatLng latLng) {
    final hasMenu =
        widget.contextMenuActions != null &&
        widget.contextMenuActions!.isNotEmpty;

    if (hasMenu) {
      setState(() {
        _contextMenuPosition = latLng;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: widget.mapController,

      options: MapOptions(
        initialCenter: LatLng(46.8, 2.2),
        initialZoom: 7,

        onTap: (_, latLng) {
          _handleTap(latLng);
        },
      ),

      children: [
        TileLayer(
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

          userAgentPackageName:
              'com.example.vamos_cartographie',
        ),

        _LiveSegmentLayer(
          trip: widget.trip,
          repaintNotifier:
              widget.editor.repaintNotifier,
          editable: widget.editable,
          onWaypointTap: widget.onWaypointTap,
          onSegmentTypeMarkerTap:
              widget.onSegmentTypeMarkerTap,
        ),

        if (widget.editable)
          DragMarkers(
            markers: widget.editor.build(),
          ),

        if (!widget.editable &&
            widget.onWaypointTap != null)
          MarkerLayer(
            markers:
                WaypointMarkersBuilder.buildMarkers(
              widget.trip,
              widget.onWaypointTap!,
            ),
          ),

        if (_contextMenuPosition != null &&
            widget.contextMenuActions != null)
          MapContextMenu(
            position: _contextMenuPosition!,
            actions: widget.contextMenuActions!,
            onClose: () {
              setState(() {
                _contextMenuPosition = null;
              });
            },
          ),
      ],
    );
  }
}veSegmentLayer ─────────────────────────────────────────────────────────
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
