// import 'package:flutter/material.dart';
// import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
// import 'package:vamos_cartographie/features/map_ui/presentation/widgets/widgets.dart';

// class PolyEditorService {
//   static List<DragMarker> buildMarkers({
//     required Trip trip,
//     required void Function(int index, LatLng latLng) onWaypointMoved,
//     required void Function(int segmentIndex, int pointIndex, LatLng latLng)
//     onIntermediateMoved,
//   }) {
//     final markers = <DragMarker>[];

//     for (var i = 0; i < trip.waypoints.length; i++) {
//       final waypoint = trip.waypoints[i];

//       markers.add(
//         DragMarker(
//           size: const Size(36, 36),
//           point: waypoint.latLng,
//           onDragUpdate: (_, latLng) {
//             onWaypointMoved(i, latLng);
//           },
//           builder: (_, __, isDragging) {
//             return WaypointMarker(waypoint: waypoint, isDragging: isDragging);
//           },
//         ),
//       );
//     }

//     return markers;
//   }
// }
// class CustomPolyEditor {
//   final Trip trip;

//   /// Incrémenté à chaque mouvement de drag — les listeners (MapView)
//   /// se redessinent sans reconstruire les DragMarkers.
//   final ValueNotifier<int> repaintNotifier = ValueNotifier(0);

//   /// Appelé uniquement quand la liste des markers doit être reconstruite
//   /// (insertion ou suppression d'un point). Déclenche un setState dans MapPage.
//   final void Function(LatLng? point) callbackRefresh;

//   // final void Function(int index) onWaypointLongPress;
//   final void Function(int segmentIndex) onSegmentMidpointInserted;
//   final void Function(int segmentIndex, int pointIndex)
//   onIntermediatePointDeleted;

//   int? _draggingWaypointIndex;
//   int? _draggingIntermediateSegment;
//   int? _draggingIntermediateIndex;

//   CustomPolyEditor({
//     required this.trip,
//     required this.callbackRefresh,
//     // required this.onWaypointLongPress,
//     required this.onSegmentMidpointInserted,
//     required this.onIntermediatePointDeleted,
//   });

//   /// Notifie un repaint léger sans reconstruire les DragMarkers.
//   void _repaint() => repaintNotifier.value++;

//   List<DragMarker> edit() {
//     final markers = <DragMarker>[];

//     // -- Waypoints principaux --
//     for (var i = 0; i < trip.waypoints.length; i++) {
//       final wp = trip.waypoints[i];
//       final index = i;

//       markers.add(
//         DragMarker(
//           point: wp.latLng,
//           size: const Size(36, 36),
//           builder: (_, __, isDragging) => _buildWaypointIcon(wp, isDragging),
//           onDragStart: (_, __) => _draggingWaypointIndex = index,
//           onDragUpdate: (_, latLng) {
//             trip.waypoints[index].latLng = latLng;
//             // La liste ne change pas de taille → rebuild complet OK
//             callbackRefresh(latLng);
//           },
//           onDragEnd: (_, __) => _draggingWaypointIndex = null,
//           // onTap: (_) => onWaypointLongPress(index),
//         ),
//       );
//     }

//     // -- Midpoints intermédiaires par segment --
//     for (var s = 0; s < trip.segments.length; s++) {
//       final segment = trip.segments[s];
//       final segIndex = s;

//       // Midpoints déjà insérés dans ce segment
//       for (var p = 0; p < segment.geometry.length; p++) {
//         final pIndex = p;
//         markers.add(
//           geometry(
//             point: segment.geometry[p],
//             segmentType: trip.segments[segIndex].type,
//             isGhost: false,
//             onDragStartCallback: (_, __) {
//               _draggingIntermediateSegment = segIndex;
//               _draggingIntermediateIndex = pIndex;
//             },
//             onDragUpdateCallback: (_, latLng) {
//               trip.segments[segIndex].geometry[pIndex] = latLng;
//               // La liste ne change pas de taille → rebuild complet OK
//               // Les ghost points se repositionnent correctement
//               callbackRefresh(latLng);
//             },
//             onDragEndCallback: (_, __) {
//               _draggingIntermediateSegment = null;
//               _draggingIntermediateIndex = null;
//             },
//             onTapCallback: (_) {
//               trip.segments[segIndex].geometry.removeAt(pIndex);
//               onIntermediatePointDeleted(segIndex, pIndex);
//             },
//           ),
//         );
//       }

//       // Fantôme au milieu de chaque sous-segment (pour insérer un nouveau point)
//       final points = trip.segmentPoints(s);
//       if (points.length >= 2) {
//         for (var pp = 0; pp < points.length - 1; pp++) {
//           final from = points[pp];
//           final to = points[pp + 1];
//           final mid = LatLng(
//             from.latitude + (to.latitude - from.latitude) / 2,
//             from.longitude + (to.longitude - from.longitude) / 2,
//           );
//           final insertAt = pp;

//           markers.add(
//             geometry(
//               point: mid,
//               segmentType: trip.segments[segIndex].type,
//               isGhost: true,
//               onDragStartCallback: (_, __) {
//                 // Insère le point fantôme comme point réel
//                 trip.segments[segIndex].geometry.insert(
//                   insertAt,
//                   mid,
//                 );
//                 _draggingIntermediateSegment = segIndex;
//                 _draggingIntermediateIndex = insertAt;
//                 // Repaint léger : on ne reconstruit PAS les DragMarkers
//                 _repaint();
//               },
//               onDragUpdateCallback: (_, latLng) {
//                 if (_draggingIntermediateSegment != null &&
//                     _draggingIntermediateIndex != null) {
//                   trip
//                           .segments[_draggingIntermediateSegment!]
//                           .geometry[_draggingIntermediateIndex!] =
//                       latLng;
//                   _repaint();
//                 }
//               },
//               onDragEndCallback: (_, __) {
//                 // Reconstruction complète des markers seulement à la fin du drag
//                 final seg = _draggingIntermediateSegment;
//                 _draggingIntermediateSegment = null;
//                 _draggingIntermediateIndex = null;
//                 if (seg != null) onSegmentMidpointInserted(seg);
//               },
//             ),
//           );
//         }
//       }
//     }

//     return markers;
//   }

//   Widget _buildWaypointIcon(Waypoint wp, bool isDragging) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isDragging ? wp.type.color.withOpacity(0.7) : wp.type.color,
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.white, width: 2),
//         boxShadow: isDragging
//             ? [BoxShadow(color: Colors.black26, blurRadius: 8)]
//             : [],
//       ),
//       child: Icon(wp.type.icon, color: Colors.white, size: 20),
//     );
//   }
// }
