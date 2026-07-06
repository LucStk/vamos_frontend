import 'package:map_application/map_application.dart';

TransitionResult reduceVertex(MapMode state, MapEvent event) {
  return switch (event) {
    VertexDragEnd e => TransitionResult(
      nextState: state,
      intents: [UpdateVertexPosition(e.vertexRef, e.latLng)],
    ),

    _ => TransitionResult(nextState: state),
  };
}

// TransitionResult _reduceDraggingVertex(
//   DraggingVertex state,
//   MapIntents intent,
// ) {
//   if (intent is PointerMoved) {
//     return TransitionResult(
//       nextState: state,
//       effects: [
//         // MoveVertexEffect(
//         //   vertexId: state.vertexId,
//         //   newPosition: intent.position,
//         // ),
//       ],
//     );
//   }

//   if (intent is PointerReleased) {
//     return TransitionResult(
//       nextState: MapMode.vertexSelected(vertexId: state.vertexId),
//     );
//   }

//   return TransitionResult(nextState: state);
// }
