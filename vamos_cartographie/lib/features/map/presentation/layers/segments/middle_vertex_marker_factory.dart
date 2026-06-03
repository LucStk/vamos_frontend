import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:vamos_cartographie/features/segments/segments.dart';
import 'markers/middle_vertex_marker_view.dart';

/// Construit les markers draggables pour les middleVertices d'un segment
List<Marker> buildMiddleVertexMarkers(
  WidgetRef ref,
  BuildContext context,
  int tripId,
  int segmentId,
) {
  final segment = ref.watch(segmentProvider(tripId, segmentId));
  final type = segment?.type;

  if (segment == null || type == null) return [];

  return segment.middleVertices.map((vertex) {
    return Marker(
      point: vertex.point,
      width: 24,
      height: 24,
      alignment: Alignment.center,
      child: Draggable<String>(
        data: vertex.id,
        feedback: Material(
          color: Colors.transparent,
          child: SizedBox(
            width: 24,
            height: 24,
            child: MiddleVertexMarkerView(type: type),
          ),
        ),
        childWhenDragging: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: type.color.withOpacity(0.3),
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 2),
          ),
        ),
        onDragEnd: (details) {
          // Convertir la position globale en coordonnées lat/lng
          // Note: Cela nécessite d'avoir accès au MapController
          // Pour l'instant, nous allons implémenter une version simplifiée
          // L'utilisateur devra utiliser un DragTarget sur la map
        },
        child: GestureDetector(
          onLongPress: () {
            // Possibilité de supprimer le vertex avec un long press
            _showDeleteDialog(context, ref, tripId, segmentId, vertex.id);
          },
          child: MiddleVertexMarkerView(type: type),
        ),
      ),
    );
  }).toList();
}

void _showDeleteDialog(
  BuildContext context,
  WidgetRef ref,
  int tripId,
  int segmentId,
  String vertexId,
) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Supprimer le point'),
      content: const Text('Voulez-vous supprimer ce point intermédiaire ?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(segmentsStoreProvider(tripId).notifier)
                .removeMiddleVertex(vertexId: vertexId);
            Navigator.pop(context);
          },
          child: const Text('Supprimer'),
        ),
      ],
    ),
  );
}
