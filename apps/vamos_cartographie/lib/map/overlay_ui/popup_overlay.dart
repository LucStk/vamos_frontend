// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:domain_core/domain_core.dart';
// import 'package:map_application/map_application.dart';
// import 'package:trip_application/trip_application.dart';
// import '/map/map.dart';

// class PopUpOverlay extends ConsumerWidget {
//   const PopUpOverlay({super.key, required this.tripId});
//   final Id<Trip> tripId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final stateSelection = ref.watch(
//       mapStateProvider(tripId).select((state) => state.selection),
//     );
//     final editor = ref.read(mapStateProvider(tripId).notifier);

//     switch (stateSelection) {
//       case MapSketchPencil p:
//         final point = editor.camera.latLngToPoint(p.latLng);
//         final offset = Offset(point.x, point.y);
//         return Stack(
//           children: [
//             Positioned(
//               left: offset.dx,
//               top: offset.dy,
//               child: FractionalTranslation(
//                 translation: const Offset(-0.5, -1.0),
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 20.0),
//                   child: const SizedBox.shrink(),
//                 ),
//               ),
//             ),
//           ],
//         );
//       case _:
//         return const SizedBox.shrink();
//     }
//   }
// }
