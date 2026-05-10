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

  const MapView({
    Key? key,
    required this.trip,
    required this.editor,
    this.onTap,
    this.onSegmentTypeMarkerTap,
    this.onWaypointTap,
    this.editable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
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

        // Un PolylineLayer par segment pour les styles différents
        ...SegmentLayersBuilder.buildLayers(trip),

        // Markers éditables (uniquement en mode édition)
        if (editable) DragMarkers(markers: editor.edit()),

        // Markers statiques des waypoints (toujours visibles)
        // En mode édition ils sont en dessous des DragMarkers,
        // en mode observateur ils sont tappables pour voir les infos.
        if (!editable && onWaypointTap != null)
          MarkerLayer(
            markers: WaypointMarkersBuilder.buildMarkers(trip, onWaypointTap!),
          ),

        // Marqueurs pour changer le type de segment
        MarkerLayer(
          markers: onSegmentTypeMarkerTap != null
              ? SegmentTypeMarkersBuilder.buildMarkers(
                  trip,
                  onSegmentTypeMarkerTap!,
                )
              : [],
        ),
      ],
    );
  }
}
